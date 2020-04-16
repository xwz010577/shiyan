<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>添加商品</title>
<link rel="stylesheet" href="layui/css/layui.css">
</head>
<body>
<h1 style="text-align: center; margin-top: 20px;"> 引进新的商品信息</h1>	<hr class="layui-bg-black">
<div class="site-text" style="margin: 50px auto; width:500px;" id="window" >
	
	<form class="layui-form layui-form-pane" id="merchbill"  lay-filter="formTest">
	  <div class="layui-form-item">
	    <label class="layui-form-label">商品编号</label>
	    <div class="layui-input-block">
	      <input type="text" required id="merchid" name="merchid" lay-verify="required"  placeholder="请输入商品编号" class="layui-input">
	    </div>
	  </div>
	  <div class="layui-form-item">
	    <label class="layui-form-label">供货商号</label>
	    <div class="layui-input-block">
	      <!-- <input type="text" required   id="profferid" name="profferid" lay-verify="required"  placeholder="请输入供货商号" class="layui-input"> -->
	      <select name="profferid">
	      		<c:forEach items="${proffer }" var="proid">
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
	      	<option value="其它类">其它类</option>
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
	      <input type="text" id="unitcost" name="unitcost" lay-verify="number|required"  placeholder="请输入单价" class="layui-input">
	    </div>
	  </div>
	  <div class="layui-form-item">
	    <label class="layui-form-label">备注</label>
	    <div class="layui-input-block">
	      <input type="text" id="other" name="other" lay-verify="other"  placeholder="请输入住址" class="layui-input">
	    </div>
	  </div>
	  <button class="layui-btn layui-btn-small bcql-icon icon-save" style="float: right;" id="formDemo1" lay-submit lay-filter="formDemo1" >引进新的商品</button>
	</form>
</div>
<script src="layui/layui.js"></script>
<script>
layui.use(['element','form','table','jquery'], function(){
	var element = layui.element;
    var form = layui.form;
    var $=layui.jquery
    form.on('submit(formDemo1)', function(data){
        var field = data.field; //获取提交的字段
        $.ajax({
      		url:'/ww.market/toinsertMerch',
      		type:'post',
      		datatype:'json',
      		data:field,
      		success:function(data){
      			if(data>0){
            			  layer.alert('增加成功',{icon:1,title:'提示'},function(i){
            				  layer.close(i);
                              $("#merchbill")[0].reset()//重置form
            			  })
            		  }else{
            			layer.alert('已存在',{icon:1,title:'提示'},function(i){
            				  layer.close(i);
                              $("#merchbill")[0].reset()//重置form
            			  })
            		  }
      		}
      	 });
        return false;
      });  
});
</script>
</body>
</html>