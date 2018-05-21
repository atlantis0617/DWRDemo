package org.dwr.util;

import java.util.Collection;

import org.directwebremoting.ScriptBuffer;
import org.directwebremoting.ScriptSession;
import org.directwebremoting.WebContext;
import org.directwebremoting.WebContextFactory;
import org.directwebremoting.proxy.dwr.Util;

public class DwrPush {
	
	@SuppressWarnings("deprecation")
	public void send(String msg) {
        // 获取WebContext对象，获取request，session等的辅助类
        WebContext webContext = WebContextFactory.get();
        // 获取访问页面的所有用户
        Collection<ScriptSession> sessions = webContext.getAllScriptSessions();
        // 创建ScriptBuffer对象
        ScriptBuffer sb = new ScriptBuffer();
        // 调用old_callback方法，传入参数
        sb.appendCall("old_callback", msg);
        // 根据ScriptSession创建DWR的Util对象
        Util util = new Util(sessions);
        // 回调js方法
        util.addScript(sb);
    }

}
