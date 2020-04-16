<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>修改商品信息</title>
<link rel="stylesheet" href="layui/css/layui.css">
</head>
<body>
<div class="site-text" style="margin: 5%;" id="window1" >	
	<form class="layui-form layui-form-pane" id="staff1"  lay-filter="formTest1">
	  
	   
	      <input type="text" style="display: none;" required id="merchid" name="merchid" lay-verify="required"  placeholder="请输入商品编号" class="layui-input">
	    
	  <div class="layui-form-item">
	    <label class="layui-form-label">供货商号</label>
	    <div class="layui-input-block">
	      <!-- <input type="text" required   id="profferid" name="profferid" lay-verify="required"  placeholder="请输入供货商号" class="layui-input"> -->
	       <select name="profferid">
	      		<c:forEach items="${profferid }" var="proid">
	      			<option value="${proid }">${proid }</option>
	      		</c:forEach>
	      </select>
	    </div>
	  </div>
	  <div class="layui-form-item">
    	<label class="layui-form-label">名称</label>
    	<div class="layui-input-block">
     		 <input type="text" required   id="fullname" name="fullname" lay-verify="required"  placeholder="请输入名称" class="layui-input">
   		 </div>
 	   </div>
	  <div class="layui-form-item">
	    <label class="layui-form-label">类别</label>
	    <div class="layui-input-block">
	      <!-- <input type="text" required   id="kind" name="kind" lay-verify="kind"  placeholder="请输入类别" class="layui-input"> -->
	      <select name="kind">
	      	<option value="蔬菜类">蔬菜类</option>
	      	<option value="杂粮类">杂粮类</option>
	      	<option value="生物类">生物类</option>
	      	<option value="水果类">水果类</option>
	      	<option value="零食类">零食类</option>
	      	<option value="酒类">酒类</option>
	      	<option value="其他类">其他类</option>
	      </select>
	    </div>
	  </div>
	  <div class="layui-form-item">
	    <label class="layui-form-label">产地</label>
	    <div class="layui-input-block">
	      <input type="text"  id="birthplace" name="birthplace" lay-verify="birthplace"  placeholder="请输入产地" class="layui-input">
	    </div>
	  </div>
	  <div class="layui-form-item">
	    <label class="layui-form-label">单价</label>
	    <div class="layui-input-block">
	      <input type="text" id="unitcost" name="unitcost" lay-verify="number"  placeholder="请输入单价" class="layui-input">
	    </div>
	  </div>
	  <div class="layui-form-item">
	    <label class="layui-form-label">备注</label>
	    <div class="layui-input-block">
	      <input type="text" id="other" name="other" lay-verify="other"  placeholder="请输入住址" class="layui-input">
	    </div>
	  </div>
	  <button class="layui-btn layui-btn-small bcql-icon icon-save" lay-submit id="formDemo" lay-filter="formDemo" style="display: none;"></button>
	</form>
</div>
<script src="layui/layui.all.js"></script>
<script>
	var element = layui.element;
    var form = layui.form;
    var $=layui.jquery;
    var laydate = layui.laydate;
    //初始化商品表单信息
    form.val("formTest1",{
    	"merchid"  : "${merch.merchid}",
		"profferid"  : "${merch.profferid}",
		 "fullname" : "${merch.fullname}",
		 "kind"  : "${merch.kind}",
		 "birthplace"  : "${merch.birthplace}",
		 "unitcost": "${merch.unitcost}",
		 "other"  : "${merch.other}"
    });

</script>
</body>
</html>