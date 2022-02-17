using System.Collections.Generic;
using UnityEngine;
using UnityEngine.EventSystems;
using UnityEngine.UI;

class FeatureUI : UIWindow
{
    public List<PlayerItemFeature> m_list = new List<PlayerItemFeature>();
    #region 脚本工具生成的代码
    private GameObject m_goFeature;
    private Transform m_tfContent;
    private Transform m_tfFeatureContent;
    private GameObject m_itemFeature;
    private Text m_textLeft;
    private Button m_btnBig;
    private Button m_btnSmall;
    private GameObject m_goImg;
    protected override void ScriptGenerator()
    {
        m_goFeature = FindChild("m_goFeature").gameObject;
        var move = CreateWidget<FeatureMove>("m_goFeature");
        m_goImg = FindChild("m_goFeature/m_goImg").gameObject;
        m_tfContent = FindChild("m_goFeature/m_tfContent");
        m_tfFeatureContent = FindChild("m_goFeature/m_tfContent/m_tfFeatureContent");
        m_itemFeature = FindChild("m_goFeature/m_tfContent/m_tfFeatureContent/m_itemFeature").gameObject;
        m_textLeft = FindChildComponent<Text>("m_goFeature/m_tfContent/m_textLeft");
        m_btnBig = FindChildComponent<Button>("m_goFeature/m_btnBig");
        m_btnSmall = FindChildComponent<Button>("m_goFeature/m_btnSmall");
        m_btnBig.onClick.AddListener(OnClickBigBtn);
        m_btnSmall.onClick.AddListener(OnClickSmallBtn);

        m_itemFeature.gameObject.SetActive(false);
        m_btnBig.gameObject.SetActive(false);
        if (!GameMgr.Instance.IsLandScape)
        {
            m_goFeature.transform.localScale = new Vector2(2, 2);
            var rect = m_goFeature.transform as RectTransform;
            CanvasUtils.RightBottom(rect,150,200);
        }
    }
    #endregion

    protected override void RegisterEvent()
    {
        base.RegisterEvent();
        EventCenter.Instance.AddEventListener("RefreshFeature", RefreshFeature);
    }

    protected override void DeRegisterEvent()
    {
        base.DeRegisterEvent();
        EventCenter.Instance.RemoveEventListener("RefreshFeature", RefreshFeature);
    }

    private void RefreshFeature()
    {
        var features = RogueLikeMgr.Instance.FeaturesList;
        AdjustIconNum(m_list, features.Count,m_tfFeatureContent,m_itemFeature);
        for (int i = 0; i < m_list.Count; i++)
        {
            m_list[i].Init(features[i]);
        }

        m_textLeft.text = string.Format("剩余格子:{0}  ",RogueLikeMgr.Instance.playerData.LeftFeatureSlot);
    }

    #region 事件
    private void OnClickBigBtn()
    {
        m_goImg.gameObject.SetActive(true);
        m_tfContent.gameObject.SetActive(true);
        m_btnSmall.gameObject.SetActive(true);
        m_btnBig.gameObject.SetActive(false);
    }
    private void OnClickSmallBtn()
    {
        m_goImg.gameObject.SetActive(false);
        m_tfContent.gameObject.SetActive(false);
        m_btnSmall.gameObject.SetActive(false);
        m_btnBig.gameObject.SetActive(true);
    }
    #endregion

}

class PlayerItemFeature : UIWindowWidget
{
    #region 脚本工具生成的代码
    private Text m_textFeature;
    private Text m_textSlot;
    private Button m_btnUse;
    protected override void ScriptGenerator()
    {
        m_textFeature = FindChildComponent<Text>("bg/m_textFeature");
        m_textSlot = FindChildComponent<Text>("bg/m_textSlot");
        m_btnUse = FindChildComponent<Button>("bg/m_btnUse");
    }
    #endregion

    public void Init(PlayerFeatureConfig config)
    {
        if (config == null)
        {
            return;
        }
        m_textFeature.text = (config.UseColor == 1) ? config.Name.ToColor(config.ColorStr) : config.Name;
        m_textSlot.text = config.Slot + "格";
        if (config.CanUse == 0)
        {
            m_btnUse.gameObject.SetActive(false);
        }
    }

    #region 事件
    #endregion

}


class FeatureMove : UIEventItem<FeatureMove>
{
    public enum UIDragType
    {
        Draging,
        Drop
    }
    private UIDragType m_dragState = UIDragType.Drop;
    private Vector3 m_itemOldPos;
    private Vector3 m_itemCachePos;
    private bool m_CanDrag = true;
    protected override void OnCreate()
    {
        base.OnCreate();

        BindBeginDragEvent(delegate (FeatureMove item, PointerEventData data)
        {
            if (!m_CanDrag)
            {
                return;
            }
            StartDragItem(UIDragType.Draging);
        });

        BindEndDragEvent(delegate (FeatureMove item, PointerEventData data)
        {
            if (!m_CanDrag)
            {
                return;
            }
            EndDrag();
        });
    }

    protected override void OnUpdate()
    {
        if (!m_CanDrag)
        {
            return;
        }
        UpdateDragPos();
    }

    private void StartDragItem(UIDragType type)
    {
        Debug.Log("Start Drag" + type);
        if (type != UIDragType.Drop)
        {
            m_itemOldPos = transform.position;
            Vector3 pos;
            UISys.Mgr.GetMouseDownUiPos(out pos);
            m_itemOldPos = pos;
            UpdateDragPos();
            m_dragState = type;
        }
    }

    private void EndDrag()
    {
        m_dragState = UIDragType.Drop;
        transform.position = m_itemOldPos;
    }

    private void UpdateDragPos()
    {
        if (m_dragState == UIDragType.Drop)
        {
            return;
        }

        Vector3 pos;
        UISys.Mgr.GetMouseDownUiPos(out pos);
        transform.position += (pos - m_itemOldPos);
        m_itemOldPos = pos;
    }
}

