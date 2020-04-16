<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>制作进货清单</title>
<link rel="stylesheet" href="layui/css/layui.css">
</head>
<body>
<div class="site-text" style="margin: 5%;" id="window1" >	
	<form class="layui-form layui-form-pane" id="importbill"  lay-filter="formTest1">
	  
	      <input type="text" style="display: none" required id="imortbillid" name="imortbillid" lay-verify="required"   placeholder="请输入进货单号" class="layui-input">
	   
	  <div class="layui-form-item">
	    <label class="layui-form-label">商品编号</label>
	    <div class="layui-input-block">
	      <input type="text" required  readonly="readonly" id="merchid" name="merchid" lay-verify="required"  placeholder="请输入商品编号" class="layui-input">
	    </div>
	  </div>
	  <div class="layui-form-item">
    	<label class="layui-form-label">供货商号</label>
    	<div class="layui-input-block">
     		  <input type="text" required readonly="readonly"   id="profferid" name="profferid" lay-verify="required"  placeholder="请输入供货商号" class="layui-input">
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
	  <div class="layui-form-item">
	    <label class="layui-form-label">进货日期</label>
	    <div class="layui-input-block">
	      <input type="text" id="importdate" readonly="readonly" name="importdate" lay-verify="required"  placeholder="请输入进货日期" class="layui-input">
	    </div>
	  </div>
	  <div class="layui-form-item">
	    <label class="layui-form-label">备注</label>
	    <div class="layui-input-block">
	      <input type="text" id="other" name="other" lay-verify="other"  placeholder="请输入备注" class="layui-input">
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
    //初始化员工表单信息
   form.val("formTest1",{
	"imortbillid" : "${importbill.imortbillid}",
	"merchid"  : "${importbill.merchid}",
	 "profferid" : "${importbill.profferid}",
	 "importprice"  : "${importbill.importprice}",
	 "quantity"  : "${importbill.quantity}",
	 "totalmoney": "${importbill.totalmoney}",
	 "other"  : "${importbill.other}"
}); 
    //绑定进货日期
   laydate.render({ 
		  elem: '#importdate'
		  ,value: new Date("${importbill.importdate}")
   		  ,format:"yyyy-MM-dd"
		}); 
    //计算总价
   $('#quantity,#importprice').bind('input propertychange',function(){
   	var p=$("#importprice").val(),q=$("#quantity").val();
   	if(p&&q){
   		if(!isNaN(p)&&!isNaN(q)){
   			$("#totalmoney").val(p*q);
   		}
   	}
   });

</script>
</body>
</html>