using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using LitJson;

public class JsonHelper : Singleton<JsonHelper>
{
    public JsonHelper()
    {
        
    }

    public T Deserialize<T>(string json)
    {
        return JsonMapper.ToObject<T>(json);
    }

    public string Serialize(Object jsonData)
    {
        return JsonMapper.ToJson(jsonData);
    }
}