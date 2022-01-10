using UnityEngine;
using BestHTTP.WebSocket;
using System;
using BestHTTP;
using RegicideProtocol;

public class WebSocketMgr : UnitySingleton<WebSocketMgr>
{
    //string address = "wss://echo.websocket.org";
    //public string address = "ws://127.0.0.1:12345/ws";
    public WebSocket webSocket;
    private Action m_Action = null;
    public bool m_useReconnect = true;
    private bool m_hadInit = true;
    public void Init(Action callback = null)
    {
        m_hadInit = true;
        var address = GameApp.Instance.Host;

        m_Action = callback;
        if (webSocket == null)
        {
            webSocket = new WebSocket(new Uri(address));

#if !UNITY_WEBGL
            webSocket.StartPingThread = true;
#endif

            // Subscribe to the WS events
            webSocket.OnOpen += OnOpen;
            webSocket.OnMessage += OnMessageRecv;
            webSocket.OnBinary += OnBinaryRecv;
            webSocket.OnClosed += OnClosed;
            webSocket.OnError += OnError;
            webSocket.Open();
            
        }
    }

    public void Destroy()
    {
        if (webSocket != null)
        {
            webSocket.Close();
            webSocket = null;
        }
    }

    void OnOpen(WebSocket ws)
    {
        //Debug.Log("WebSocket open ");
        UISys.ShowTipMsg("服务器连接成功~");
        if (m_Action!= null)
        {
            m_Action();

            m_Action = null;
        }

        GameClient.Instance.Status = GameClientStatus.StatusConnect;
    }

    void OnMessageRecv(WebSocket ws, string message)
    {
        Debug.LogFormat("OnMessageRecv: msg={0}", message);
    }

    void OnBinaryRecv(WebSocket ws, byte[] data)
    {
        Debug.LogFormat("OnBinaryRecv: len={0}", data.Length);
        RecivePack(ws, data);
    }

    private void RecivePack(WebSocket webSocket, byte[] bufBytes)
    {
        var length = bufBytes.Length;

        int count = length - 4;

        int bufferAllCount = count + 4;    //整条消息的长度

        MainPack pack = (MainPack)MainPack.Descriptor.Parser.ParseFrom(bufBytes, 4, count);


        GameClient.Instance.HandleResponse(pack);

        Debug.Log(pack);

        Array.Copy(bufBytes, bufferAllCount, bufBytes, 0, 4 - bufferAllCount);
    }

    public bool Send(MainPack pack)
    {
        if (webSocket == null || !webSocket.IsOpen)
        {
            Debug.LogError("Socket Connect => false");
            return false;
        }
        webSocket.Send(Message.PackData(pack));
        return true;
    }

    void OnClosed(WebSocket ws, UInt16 code, string message)
    {
        Debug.LogFormat("OnClosed: code={0}, msg={1}", code, message);
        webSocket = null;
        GameClient.Instance.Status = GameClientStatus.StatusClose;
        GameDataMgr.Instance.HadLogin = false;
    }

    void OnError(WebSocket ws, string reason)
    {
        GameClient.Instance.Status = GameClientStatus.StatusClose;
        string errorMsg = string.Empty;
#if !UNITY_WEBGL || UNITY_EDITOR
        if (ws.InternalRequest.Response != null)
        {
            errorMsg = string.Format("Status Code from Server: {0} and Message: {1}", ws.InternalRequest.Response.StatusCode, ws.InternalRequest.Response.Message);
        }
#endif
        Debug.LogFormat("OnError: error occured: {0}\n", ("Unknown Error " + errorMsg));
        Debug.Log(reason);
        webSocket = null;
        GameDataMgr.Instance.HadLogin = false;
    }


    public void Get(string url)
    {
        HTTPRequest request = new HTTPRequest(new Uri(url), OnRequestFinished);request.Send();
       
    }
    void OnRequestFinished(HTTPRequest request, HTTPResponse response)
    {
        Debug.Log("Request Finished! Text received: " +response.DataAsText);
    }

    public void Post(string url)
    {
        HTTPRequest request = new HTTPRequest(new Uri(url), HTTPMethods.Post,
        OnRequestFinished);
        request.AddField("FieldName", "Field Value");
        request.Send();
    }

    private bool m_enableReConnect;
    void Update()
    {
#if UNITY_EDITOR

        if (Input.GetKeyDown(KeyCode.A))
        {
            if (webSocket != null)
            {
                webSocket.Close();
                webSocket = null;
            }
        }
#endif
        if (m_useReconnect && !m_enableReConnect)
        {
            if (m_hadInit && GameClient.Instance.Status == GameClientStatus.StatusClose)
            {
                m_enableReConnect = true;

                GameClient.Instance.CheckReconnectInGames();
            }
        }
    }

    public void ReconnectSuccessed()
    {
        m_enableReConnect = false;
    }
}
