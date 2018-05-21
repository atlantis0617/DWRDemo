package org.dwr.util;

import java.util.Collection;

import org.directwebremoting.Browser;
import org.directwebremoting.ScriptBuffer;
import org.directwebremoting.ScriptSession;

public class NewDwrPush {
	
	public void send(String msg) {
        // 创建Runnable对象，设置回调对象以及回调方法
        Runnable runnable = new Runnable() {
            
            // 创建ScriptBuffer对象
            private ScriptBuffer script = new ScriptBuffer();
            
            @Override
            public void run() {
                // 设置要调用的js及参数
                script.appendCall("new_callback", msg);
                // 得到所有的ScriptSession对象
                Collection<ScriptSession> sessions = Browser.getTargetSessions();
                // 遍历每一个ScriptSession
                for (ScriptSession session: sessions) {
                    session.addScript(script); // 将推送内容添加到ScriptSession中
                }
            }
        };
        
        // 执行推送
        Browser.withAllSessions(runnable);
    }

}
