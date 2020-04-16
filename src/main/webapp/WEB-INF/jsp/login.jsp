<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>超市信息管理</title>

    <meta name="viewport" content="width=device-width, initial-scale=1">

    <meta name="keywords" content="">
    <script>
        addEventListener("load", function () {
            setTimeout(hideURLbar, 0);
        }, false);

        function hideURLbar() {
            window.scrollTo(0, 1);
        }
    </script>


    <link rel="stylesheet" href="css/style.css" type="text/css" media="all">

    <link rel="stylesheet" href="layui/css/layui.css">
    <link rel="stylesheet" href="css/yzm.css">
    <style>
        form{
            position:fixed; left:0;right:-10%; top: -10%;bottom:0;margin:auto;
            width: 400px;; height: 300px; text-align: center;background: rgba(10,10,10,.17);
            border-bottom: 8px solid #f7296f;padding: 3.5vw;border-radius: 30px 30px 50px 50px;
        }
    </style>
</head>
<body>
<div id="bg">
    <canvas width="1519" height="618"></canvas>
    <canvas width="1519" height="618"></canvas>
    <canvas width="1519" height="618"></canvas>
</div>
<form class="layui-form layui-form-pane" action="/ww.market/u_login" 	method="post" lay-filter="formTest">
    <h1 style="font-size: 50px">用户登录</h1>
    <div class="layui-form-item">
        <label class="layui-form-label">
        	<i class="layui-icon layui-icon-username " style="font-size: 30px;"></i>
        </label>
        <div class="layui-input-block">
            <input type="text" name="loginid" lay-verify="required" placeholder="请输入登录名" class="layui-input" autocomplete="off" required>
        </div>
    </div><span style="color:#FF5B74">${msg }</span>
    <div class="layui-form-item">
        <label class="layui-form-label">
			<i class="layui-icon layui-icon-password" style="font-size: 30px;"></i>
		</label>
        <div class="layui-input-block">
            <input type="password" name="password" lay-verify="required"  placeholder="请输入密码" class="layui-input" autocomplete="off" required>
        </div>
    </div>
    <div class="code layui-form-item">
    		<input type="text" class="input-val" name="verCode" value="" placeholder="请输入验证码（不区分大小写）">
        	<!-- <canvas id="canvas" width="100" height="43"></canvas> -->
        	<img src="/ww.market/captcha" width="130px" height="48px" />
    	
    </div><span style="color:#FF5B74">${yzm }</span>
    <div class="layui-form-item" style="margin-top: 20px;">
            <button class="layui-btn" lay-submit lay-filter="*">登录</button>
            <button type="reset" class="layui-btn layui-btn-primary">重置</button>
    </div>
</form>
<script src="layui/layui.js"></script>
<script src="js/jquery-1.10.2.js"></script>
<script src="js/jquery.min.js"></script>
<script src="js/canva_moving_effect.js"></script>
<script src="js/yzm.js"></script>
<script>
    //JavaScript代码区域
    layui.use(['element','form'], function(){
        var element = layui.element;
        var form = layui.form;
        form.on('submit(*)',function (data) {
            var val=$(".input-val").val().toLowerCase();
            if(val===''){
                 layer.msg('请输入验证码',{icon:5,time:2000},function () { });
                 return false;
            }else
            	return true;
        });
    });
</script>
</body>
</html>