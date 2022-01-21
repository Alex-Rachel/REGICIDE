
/// <summary>
/// 定义通用的EntityVisual接口,上层扩展
/// </summary>
public interface IEntityVisual
{
    /// <summary>
    /// 处理entity事件
    /// </summary>
    /// <param name="eventId"></param>
    void OnEntityEvent(int eventId);
}
