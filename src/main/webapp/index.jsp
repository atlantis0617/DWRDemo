<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Dwr 测试</title>
</head>
<body>
    <ul id="new_ul" style="color: red; font-size: 30px;">
        <li>新推送方式</li>
    </ul>
    
    <input type="text" name="new_msg" id="new_msg" size="30" style="height: 40px; font-size: 30px;"/>
    <input type="button" id="new_sign" value="新方式发布信息"/>
    
    <ul id="old_ul" style="color: red; font-size: 30px;">
        <li>旧推送方式</li>
    </ul>
    
    <input type="text" name="old_msg" id="old_msg" size="30" style="height: 40px; font-size: 30px;"/>
    <input type="button" id="old_sign" value="旧方式发布信息"/>
    
    
    <!-- 处理所有服务器通信 -->
    <script type="text/javascript" src="js/dwr/engine.js"></script>
    <!-- 帮助你用你从服务器得到的数据改变网页 -->
    <script type="text/javascript" src="js/dwr/util.js"></script>
    <script type="text/javascript" src="js/dwr/interface/DwrPush.js"></script>
    <script type="text/javascript" src="js/dwr/interface/NewDwrPush.js"></script>
    <script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
    <script type="text/javascript">
    
        $(function() {
            
            // 启动该页面的Reverse Ajax功能
            dwr.engine.setActiveReverseAjax(true);
            
            // 调用旧推送方式
            $("#old_sign").click(function() {
                DwrPush.send($("#old_msg").val());
                
            });
            
            // 调用新推送方式
            $("#new_sign").click(function() {
                NewDwrPush.send($("#new_msg").val());
                
            });
            
        });
    
        // 旧方式推送回调函数
        function old_callback(msg) {
            $("#old_ul").html($("#old_ul").html() + "<br/>" + msg);
        }
        
        // 新方式推送回调函数
        function new_callback(msg) {
            $("#new_ul").html($("#new_ul").html() + "<br/>" + msg);
        }
    
    </script>
</body>
</html>