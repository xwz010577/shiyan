<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>添加供应商信息</title>
<link rel="stylesheet" href="layui/css/layui.css">
</head>
<body>
<div class="site-text" style="margin: 5%;" id="window" >	
	<form class="layui-form layui-form-pane" id="proff"  lay-filter="formTest">
	<input type="text"  id="profferid" name="profferid"  style="display: none" class="layui-input" >
	  <div class="layui-form-item">
	    <label class="layui-form-label">名称</label>
	    <div class="layui-input-block">
	      <input type="text" required   id="fullname" name="fullname" lay-verify="required"  placeholder="请输入名称" class="layui-input">
	    </div>
	  </div>
	  <div class="layui-form-item">
	    <label class="layui-form-label">联系人</label>
	    <div class="layui-input-block">
	      <input type="text" required   id="contactperson" name="contactperson" lay-verify="required"  placeholder="请输入联系人" class="layui-input">
	    </div>
	  </div>
	  <div class="layui-form-item">
	    <label class="layui-form-label">联系电话</label>
	    <div class="layui-input-block">
	      <input type="text" id="phone" name="phone" lay-verify="required|phone"  placeholder="请输入电话" class="layui-input">
	    </div>
	    </div>
	  <div class="layui-form-item">
	    <label class="layui-form-label">联系住址</label>
	    <div class="layui-input-block">
	      <input type="text" id="address" name="address" lay-verify="required"  placeholder="请输入住址" class="layui-input">
	    </div>
	  </div>
	  <div class="layui-form-item">
	    <label class="layui-form-label">开户行</label>
	    <div class="layui-input-block">
	      <input type="text" required   id="openingbank" name="openingbank" lay-verify="required"  placeholder="请输入开户行" class="layui-input">
	    </div>
	  </div>
	  <div class="layui-form-item">
	    <label class="layui-form-label">银行账号</label>
	    <div class="layui-input-block">
	      <input type="text" id="accountid" name="accountid" lay-verify="required"  placeholder="请输入银行账号" class="layui-input">
	    </div>
	  </div>
	  <div class="layui-form-item">
	    <label class="layui-form-label">备注</label>
	    <div class="layui-input-block">
	      <input type="text" id="other" name="other" lay-verify="other"  placeholder="请输入备注" class="layui-input">
	    </div>
	  </div>
	  <button class="layui-btn layui-btn-small bcql-icon icon-save" lay-submit id="formDemo" lay-filter="formDemo" style="display: none;"></button>
	</form>
</div>
<script src="layui/layui.js"></script>
<script>
layui.use(['element','form','table','jquery','laydate'], function(){
	var element = layui.element;
    var form = layui.form;
    var $=layui.jquery;
    //初始化员工表单信息
    form.val("formTest",{
    	"profferid":"${proff.profferid}",
		"fullname"  : "${proff.fullname}",
		 "contactperson" : "${proff.contactperson}",
		 "phone": "${proff.phone}",
		 "address":"${proff.address}",
		 "openingbank"  : "${proff.openingbank}",
		 "accountid": "${proff.accountid}",
		 "other"  : "${proff.other}"
    });
});
</script>
</body>
</html>