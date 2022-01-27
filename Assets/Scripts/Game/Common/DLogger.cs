using System;
using System.Collections.Generic;
using System.Diagnostics;
using UnityEngine;

[Flags]
enum DLogLevel : byte
{
    NONE = 0,
    DEBUG = 1,
    INFO = 2,
    WARNING = 4,
    ERROR = 8,
    FATAL = 16,
    ALL = DEBUG | INFO | WARNING | ERROR | FATAL
}

struct DLogEvent
{
    public DLogLevel Level;
    public string Message;
    public float Time;
}

interface IDLogHandler
{
    void Log(DLogEvent dLogEvent);
}

class DLogger
{
    static UInt32 level_ = (UInt32)DLogLevel.ALL;
    static IDLogHandler _idLogHandler;

    /// <summary>
    /// 加速判断
    /// </summary>
    private static bool m_levelDebug = false;
    private static bool m_levelInfo = false;
    private static bool m_levelError = false;
    private static bool m_levelWarning = false;
    private static bool m_levelFatal = false;

    private static bool m_editorMode = false;


    #region public static
    public static void SetLevel(UInt32 level)
    {
        level_ = level;

        Log(DLogLevel.NONE, "set log level to {0}", level);

        ///判断日志级别
        m_levelDebug = ((level & (uint)DLogLevel.DEBUG) == (uint)DLogLevel.DEBUG);
        m_levelInfo = ((level & (uint)DLogLevel.INFO) == (uint)DLogLevel.INFO);
        m_levelError = ((level & (uint)DLogLevel.ERROR) == (uint)DLogLevel.ERROR);
        m_levelWarning = ((level & (uint)DLogLevel.WARNING) == (uint)DLogLevel.WARNING);
        m_levelFatal = ((level & (uint)DLogLevel.FATAL) == (uint)DLogLevel.FATAL);
    }

    public static bool IsSetLevel(UInt32 level)
    {
        return (level_ & level) != 0;
    }


    public static void SetEditorMode(bool editor)
    {
        m_editorMode = editor;
    }

    public static void SetLogHandler(IDLogHandler handler)
    {
        if (handler == null) throw new Exception("log handler is null");
        _idLogHandler = handler;
    }

    [Conditional("DOD_DEBUG")]
    public static void Info(object message)
    {
        if (m_levelInfo)
        {
            if (message == null)
            {
                message = "<Null>";
            }

            Info(message.ToString());
        }
    }

    [Conditional("DOD_DEBUG")]
    public static void Info(string message, params object[] args)
    {
        if (m_levelInfo)
        {
            Log(DLogLevel.INFO, message, args);
        }
    }


    [Conditional("DOD_DEBUG")]
    public static void Debug(string message, params object[] args)
    {
        if (m_levelDebug)
        {
            Log(DLogLevel.DEBUG, message, args);
        }
    }

    [Conditional("DOD_ASSERT")]
    public static void Assert(bool expr)
    {
        if (!expr)
        {
            if (m_levelFatal)
            {
                string message = String.Format("{0}\n{1}", "assert failed", Environment.StackTrace);
                Fatal(message);
            }
        }
    }

    [Conditional("DOD_ASSERT")]
    public static void Assert(bool expr, string errFromat, params object[] args)
    {
        if (!expr)
        {
            if (m_levelFatal)
            {
                string message = String.Format("assert failed: " + errFromat, args);
                message += ("\n" + Environment.StackTrace);
                Fatal(message);
            }
        }
    }

    public static void Warning(object message)
    {
        if (m_levelWarning)
        {
            if (message == null)
            {
                message = "<Null>";
            }
            Warning(message.ToString());
        }
    }

    public static void Warning(string message, params object[] args)
    {
        if (m_levelWarning)
        {
            Log(DLogLevel.WARNING, message, args);
        }
    }

    public static void Error(object message)
    {
        if (m_levelError)
        {
            if (message == null)
            {
                message = "<Null>";
            }
            Error(message.ToString());
        }
    }

    public static void Error(string message, params object[] args)
    {
        if (m_levelError)
        {
#if DEBUG
            message = String.Format("{0}\n{1}", message, Environment.StackTrace);
#endif
            Log(DLogLevel.ERROR, message, args);

        }
    }

    public static void Fatal(object message)
    {
        if (m_levelFatal)
        {
            if (message == null)
            {
                message = "<Null>";
            }
            Fatal(message.ToString());
        }
    }

    public static void Fatal(string message, params object[] args)
    {
        if (m_levelFatal)
        {
#if DEBUG
            message = String.Format("{0}\n{1}", message, Environment.StackTrace);
#endif
            Log(DLogLevel.FATAL, message, args);
            throw new Exception(string.Format(message, args));
        }
    }

    public static void EditorFatal(string message, params object[] args)
    {
        if (m_editorMode)
        {
            Fatal(message, args);
        }
        else
        {
            Warning(message, args);
        }
    }


    public static void EditorWarning(string message, params object[] args)
    {
        if (m_editorMode)
        {
            Warning(message, args);
        }
        else
        {
            Error(message, args);
        }
    }

    [Conditional("DOD_ASSERT")]
    public static void EditorAssert(bool expr)
    {
        if (!expr)
        {
            string message = String.Format("{0}\n{1}", "assert failed", Environment.StackTrace);

            if (m_editorMode)
            {
                Fatal(message);
            }
            else
            {
                Warning(message);
            }
        }
    }

    [Conditional("DOD_ASSERT")]
    public static void EditorAssert(bool expr, string errFromat, params object[] args)
    {
        if (!expr)
        {
            string message = String.Format("assert failed: " + errFromat, args);
            message += ("\n" + Environment.StackTrace);

            if (m_editorMode)
            {
                Fatal(message);
            }
            else
            {
                Warning(message);
            }
        }
    }

    #endregion

    static void Log(DLogLevel level, string msg, params object[] args)
    {
#if RUN_LUA
                var text = String.Format("{0}|{1}|{2}|", level, Time.realtimeSinceStartup,
                               DateTime.Now.ToString("yy-MM-dd hh:mm:ss")) + String.Format(msg, args);

#if DOD_DEBUG
/*
                [[
                    local stack = debug.traceback()
                    text = text .. "\r\n" .. stack
                ]]*/

#endif

            switch (level)
            {
                case DLogLevel.DEBUG:
                case DLogLevel.INFO:
                {
                    /*
               [[
                dod_debug(text);
               ]]
               */
                }
                    break;
                case DLogLevel.WARNING:
                {
                    /*
                [[
                 dod_warning(text);
                ]]
                */
                }
                    break;

                default:
                {
                    /*
                [[
                 dod_err(text);
                ]]
                */
                }
                    break;
            }
#else

        if (_idLogHandler == null) return;// throw new Exception("log handler is null");
        var logEvent = new DLogEvent
        {
            Level = level,
            Message =
String.Format("{0}|{1}|{2}|", level, Time.realtimeSinceStartup, DateTime.Now.ToString("yy-MM-dd hh:mm:ss")) + String.Format(msg, args),
            Time = Time.realtimeSinceStartup
        };

        _idLogHandler.Log(logEvent);


#endif
    }
}

