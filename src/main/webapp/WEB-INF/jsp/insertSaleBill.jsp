<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>制作销售清单</title>
<link rel="stylesheet" href="layui/css/layui.css">
</head>
<body>
<div class="site-text" style="margin: 5%;" id="window" >	
	<form class="layui-form layui-form-pane" id="salebill"  lay-filter="formTest">
	  <div class="layui-form-item">
	    <label class="layui-form-label">销售单号</label>
	    <div class="layui-input-block">
	      <input type="text" required id="salebillid" name="salebillid" lay-verify="required"  placeholder="请输入销售单号" class="layui-input">
	    </div>
	  </div>
	  <div class="layui-form-item">
	    <label class="layui-form-label">商品编号</label>
	    <div class="layui-input-block">
	     <!--  <input type="text" required   id="merchid" name="merchid" lay-verify="required"  placeholder="请输入商品编号" class="layui-input"> -->
	      <select id="merchid" name="merchid" lay-filter="sel" lay-verify="merchid">
	      <option value="请选择">请选择</option>
	      	<c:forEach items="${merchbill }" var="merch">
	      		<option value="${merch.merchid }">${merch.merchid }</option>
	      	</c:forEach>
	      </select>
	    </div>
	  </div>
	  <div class="layui-form-item">
    	<label class="layui-form-label">销售数量</label>
    	<div class="layui-input-block">
    		  <input id="sum" style="display: none;" value="-1">
     		  <input type="text" required   id="salenum" name="salenum" lay-verify="number|salenum"  placeholder="请输入销售数量" class="layui-input">
   		 </div>
 	   </div>
	  <div class="layui-form-item" style="display: none">
	    <label class="layui-form-label">销售日期</label>
	    <div class="layui-input-block">
	      <input type=text id="saledate" readonly="readonly" name="saledate" lay-verify="required"  placeholder="请输入销售日期" class="layui-input">
	    </div>
	  </div>
	  <button class="layui-btn layui-btn-small bcql-icon icon-save" lay-submit id="formDemo1" lay-filter="formDemo1" style="display: none;"></button>
	</form>
</div>
<script src="layui/layui.all.js"></script>
<script>
	var element = layui.element;
    var form = layui.form;
    var $=layui.jquery;
    var laydate = layui.laydate;
    var layer=layui.layer;
    
    /* 绑定当前时间 */
    var timestamp = (new Date()).getTime();
    laydate.render({ 
  	  elem: '#saledate'
  	  ,value: new Date(timestamp)
    	  
  	});
    form.verify({
    	merchid: function(value, item){ //value：表单的值、item：表单的DOM对象
    	    if(value==="请选择"){
    	    	return '请选择正确的商品号';
    	    }
    	  },
    	  salenum:function(value, item){ 
    		  var sum=$("#sum").val();
    	    if(value>sum){
    	    	return '库存量只有'+sum;
    	    }
    	  }
    	}); 
  //监听商品号选择供应商
    form.on('select(sel)', function(data){
    	$.ajax({
    		url:'/ww.market/tomerchid',
    		type:'post',
    		datatype:'json',
    		data:{
    			id:data.value
    		},
    		success:function(data){
    			if(data!="false"){
    				$("#sum").val(data);
    			}else{
    				layer.msg('商品没有库存');
    			}
    		}
    	});
    	return  false;
    	}); 
</script>
</body>
</html>