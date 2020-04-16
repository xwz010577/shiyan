<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<head>
    <meta charset="utf-8">
<link rel="stylesheet" href="layui/css/layui.css">
    <title>超市信息管理主界面</title>
     
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <div class="layui-header">
        <div class="layui-logo">超市信息管理</div>
        <!-- 头部区域（可配合layui已有的水平导航） -->
        <ul class="layui-nav layui-layout-left">
            <li class="layui-nav-item"><a href="">控制台</a></li>
            <li class="layui-nav-item"><a href="/ww.market/toMerchbill"  id="spgl" data-id="null" target="main">商品管理</a></li>
            <li class="layui-nav-item"><a href="">用户</a></li>
            <li class="layui-nav-item">
                <a href="javascript:;">其它系统</a>
                <dl class="layui-nav-child">
                    <dd><a href="">邮件管理</a></dd>
                    <dd><a href="">消息管理</a></dd>
                    <dd><a href="">授权管理</a></dd>
                </dl>
            </li>
        </ul>
        <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item">
                <a href="javascript:;">
                    <i class="layui-icon-friends layui-icon"></i>
                    王武器
                </a>
                <dl class="layui-nav-child">
                    <dd><a href="/ww.market/topassword" target="main">基本资料</a></dd>
                    <dd><a href="">安全设置</a></dd>
                    <dd><a href="/ww.market/login">退出出系统</a></dd>
                </dl>
            </li>
        </ul>
    </div>

    <div class="layui-side layui-bg-black">
        <div class="layui-side-scroll">
            <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
            <ul class="layui-nav layui-nav-tree"  lay-filter="test">
                <li class="layui-nav-item layui-nav-itemed">
                    <a class="" href="javascript:;">商品信息</a>
                    <dl class="layui-nav-child" id="tkind">
                        <dd><a href="/ww.market/toMerchbill" target="main"   data-id="蔬菜类" class="kind">蔬菜类</a></dd>
                        <dd><a href="/ww.market/toMerchbill" target="main"   data-id="杂粮类" class="kind">杂粮类</a></dd>
                        <dd><a href="/ww.market/toMerchbill" target="main"   data-id="生物类" class="kind">生物类</a></dd>
                        <dd><a href="/ww.market/toMerchbill" target="main"   data-id="水果类" class="kind">水果类</a></dd>
                        <dd><a href="/ww.market/toMerchbill" target="main"   data-id="零食类" class="kind">零食类</a></dd>
                        <dd><a href="/ww.market/toMerchbill" target="main"   data-id="酒类" class="kind">酒类</a></dd>
                        <dd><a href="/ww.market/toMerchbill" target="main"   data-id="其它类" class="kind">其它类</a></dd>
                    </dl>
                </li>
                <%-- <c:if test="false" > --%>
                <li class="layui-nav-item">
                    <a href="javascript:;">用户管理</a>
                    <dl class="layui-nav-child">
                        <dd><a href="/ww.market/tostaffbill" target="main">员工信息管理</a></dd>
                        <dd><a href="/ww.market/toProfferbill" target="main">供应商信息管理</a></dd>
                    </dl>
                </li>
                <%-- </c:if> --%>
                <li class="layui-nav-item">
                    <a href="javascript:;">销售信息</a>
                    <dl class="layui-nav-child">
                        <dd><a href="/ww.market/tosalebill" target="main">销售清单及统计分析</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a href="javascript:;">库存管理</a>
                    <dl class="layui-nav-child">
                        <dd><a href="/ww.market/tostorebill" target="main">库存信息</a></dd>
                        <dd><a href="/ww.market/toinsertImportBill" target="main">制作进货清单</a></dd>
                        <dd><a href="/ww.market/toinsertMerchBill" target="main">引进新的商品</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a href="javascript:;">进货管理</a>
                    <dl class="layui-nav-child">
                        <dd><a href="/ww.market/toImportbill" target="main" >进货清单</a></dd>
                    </dl>
                </li>
            </ul>
        </div>
    </div>

    <div class="layui-body " style=" overflow:hidden">
        <!-- 内容主体区域 -->
        <!--<div style="padding: 15px;">sdf</div>-->
        <iframe id="childFrame" src="/ww.market/toMerchbill" name="main" style="width: 100%" height="100%" ></iframe>
    </div>

    <div class="layui-footer footer footer-demo">
        <!-- 底部固定区域 -->
        <div class="layui-row">
            <div class="layui-col-md8">
                <label style="font-size: 20px;">超市信息管理系统</label>
            </div>
            <div class="layui-col-md-4">
                <label>本系统由王武强独立完成</label>
            </div>
        </div>
    </div>
</div>
<script src="layui/layui.all.js"></script>
<script>
    //JavaScript代码区域
        var element = layui.element;
        var $=layui.jquery;
        var id=null;
        $("#tkind>dd>a").click(function(){
        	id=$(this).attr("data-id");
        	});
        $("#spgl").click(function(){
        	id=$(this).attr("data-id");
        	});
        function toChildValue(){
            var txt = id;
            return txt;
        }
</script>
</body>
</html>