<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>制作进货清单</title>
<link rel="stylesheet" href="layui/css/layui.css">
</head>
<body>
<div class="layui-row">
    <div class="layui-col-xs6">
      <div class="site-text" style="margin: 5%;" id="window" >	
<h1 style="text-align:center;">制作进货清单</h1><hr class="layui-bg-black">
	<form class="layui-form layui-form-pane" id="importbill"  lay-filter="formTest">
	  <div class="layui-form-item">
	    <label class="layui-form-label">进货单号</label>
	    <div class="layui-input-block">
	      <input type="text" required id="imortbillid" name="imortbillid" lay-verify="required"  placeholder="请输入进货单号" class="layui-input">
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
    	<label class="layui-form-label">供货商号</label>
    	<div class="layui-input-block">
     		  <input type="text" required readonly="readonly"   id="profferid" name="profferid" lay-verify="profferid"  placeholder="请输入供货商号" class="layui-input">
   		 </div>
 	   </div>
	  <div class="layui-form-item">
	    <label class="layui-form-label">进货价</label>
	    <div class="layui-input-block">
	      <input type="text" required   id="importprice" name="importprice" lay-verify="number|required"  placeholder="请输入进货价" class="layui-input">
	    </div>
	  </div>
	  <div class="layui-form-item">
	    <label class="layui-form-label">进货数量</label>
	    <div class="layui-input-block">
	      <input type="text"  id="quantity" name="quantity" lay-verify="number|required"  placeholder="请输入进货数量" class="layui-input">
	    </div>
	  </div>
	  <div class="layui-form-item">
	    <label class="layui-form-label">进货总价</label>
	    <div class="layui-input-block">
	      <input type="text" id="totalmoney" readonly="readonly" name="totalmoney" lay-verify="number|required"  placeholder="请输入进货总价" class="layui-input">
	    </div>
	  </div>
	  <div class="layui-form-item" style="display: none">
	    <label class="layui-form-label">进货日期</label>
	    <div class="layui-input-block">
	      <input type=text id="importdate" readonly="readonly" name="importdate" lay-verify="required"  placeholder="请输入进货日期" class="layui-input">
	    </div>
	  </div>
	  <div class="layui-form-item">
	    <label class="layui-form-label">备注</label>
	    <div class="layui-input-block">
	      <input type="text" id="other" name="other" lay-verify="other"  placeholder="请输入备注" class="layui-input">
	    </div>
	  </div>
	  <button class="layui-btn layui-btn-small bcql-icon icon-save" style="margin-left: 45%;" lay-submit id="formDemo1" lay-filter="formDemo1" >添加新的进货单</button>
	</form>
</div>
    </div>
    <div class="layui-col-xs6">
    <div style="margin: 5%;">
    	<h1 style="text-align: center;"> 查看已有单号</h1>
    	<div class="layui-card">
        <div class="layui-card-header" >现有单号</div>
        	
	          <ul style="height:400px; overflow-y:scroll;">
	          	<c:if test="${sjzs==0 }"><h1>暂无进货信息</h1></c:if>
    			<c:forEach items="${importbills }" var="im">
    				<li class="layui-elem-quote" style="color:black;">${im.imortbillid }</li><br>
    			</c:forEach>
    		  </ul>
	        </div>
	        <input class="layui-btn" onclick="window.location.href='/ww.market/toImportbill'" style="text-align: center;" type="button" value="查看详细清单">
      </div>
    </div>
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
  	  elem: '#importdate'
  	  ,value: new Date(timestamp)
    	  
  	});
    //计算总价格
    $('#quantity,#importprice').bind('input propertychange',function(){
    	var p=$("#importprice").val(),q=$("#quantity").val();
    	if(p&&q){
    		if(!isNaN(p)&&!isNaN(q)){
    			$("#totalmoney").val(p*q);
    		}
    	}
    	
    	
    });
    //验证商品号是否选择正确
    form.verify({
    	merchid: function(value, item){ //value：表单的值、item：表单的DOM对象
    	    if(value==="请选择"){
    	    	return '请选择正确的商品号';
    	    }
    	  }
    	});   
    //监听商品号选择供应商
    form.on('select(sel)', function(data){
    	$.ajax({
    		url:'/ww.market/toselectmerchid',
    		type:'post',
    		datatype:'json',
    		data:{
    			id:data.value
    		},
    		success:function(data){
    			if(data!="false"){
    				$("#profferid").val(data);
    			}
    		}
    	});
    	return  false;
    	}); 
    //添加
    form.on('submit(formDemo1)', function(data){
        var field = data.field; //获取提交的字段
        $.ajax({
      		url:'/ww.market/toinsertImport',
      		type:'post',
      		datatype:'json',
      		data:field,
      		success:function(data){
      			if(data>0){
            			  layer.alert('增加成功',{icon:1,title:'提示'},function(i){
            				  layer.close(i);
            				  window.location.href="/ww.market/toinsertImportBill";
                              $("#importbill")[0].reset()//重置form
            			  })
            		  }else{
            			layer.alert('已存在',{icon:1,title:'提示'},function(i){
            				  layer.close(i);
                              $("#importbill")[0].reset()//重置form
            			  })
            		  }
      		}
      	 });
        return false;
      });  
    
    
</script>
</body>
</html>