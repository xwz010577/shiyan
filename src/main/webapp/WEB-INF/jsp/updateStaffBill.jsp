<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>修改员工信息</title>
<link rel="stylesheet" href="layui/css/layui.css">
</head>
<body>
<div class="site-text" style="margin: 5%;" id="window1" >	
	<form class="layui-form layui-form-pane" id="staff1"  lay-filter="formTest1">
	  
	      <input type="text" required id="staffid" name="staffid" lay-verify="required" style="display: none;"  placeholder="请输入编号" class="layui-input">
	    
	  <div class="layui-form-item">
	    <label class="layui-form-label">员工名称</label>
	    <div class="layui-input-block">
	      <input type="text" required   id="name" name="name" lay-verify="required"  placeholder="请输入名称" class="layui-input">
	    </div>
	  </div>
	  <div class="layui-form-item">
    	<label class="layui-form-label">员工性别</label>
    	<div class="layui-input-block">
     		 <input type="radio" name="sex" value="男" title="男">
    		 <input type="radio" name="sex" value="女" title="女" checked>
   		 </div>
 	   </div>
	  <div class="layui-form-item">
	    <label class="layui-form-label">员工学历</label>
	    <div class="layui-input-block">
	      <input type="text" required   id="diploma" name="diploma" lay-verify="required"  placeholder="请输入学历" class="layui-input">
	    </div>
	  </div>
	  <div class="layui-form-item">
	    <label class="layui-form-label">员工工资</label>
	    <div class="layui-input-block">
	      <input type="text"  id="salary" name="salary" lay-verify="number"  placeholder="请输入工资" class="layui-input">
	    </div>
	  </div>
	  <div class="layui-form-item">
	    <label class="layui-form-label">员工电话</label>
	    <div class="layui-input-block">
	      <input type="text"  id="phone" name="phone" lay-verify="number|phone"  placeholder="请输入电话" class="layui-input">
	    </div>
	  </div>
	  <div class="layui-form-item">
	    <label class="layui-form-label">员工住址</label>
	    <div class="layui-input-block">
	      <input type="text" id="address" name="address" lay-verify="address"  placeholder="请输入住址" class="layui-input">
	    </div>
	  </div>
	  <div class="layui-form-item">
	    <label class="layui-form-label">身份证号</label>
	    <div class="layui-input-block">
	      <input type="text" required   id="idcard" name="idcard" lay-verify="identity"  placeholder="请输入身份证号" class="layui-input">
	    </div>
	  </div>
	  <div class="layui-form-item">
	    <label class="layui-form-label">聘用日期</label>
	    <div class="layui-input-block">
	      <input type="text" id="begindate" name="begindate" lay-verify="required"  placeholder="请输入聘用日期" class="layui-input">
	    </div>
	  </div>
	  <div class="layui-form-item">
	    <label class="layui-form-label">备注</label>
	    <div class="layui-input-block">
	      <input type="text" id="other" name="other" lay-verify="other"  placeholder="请输入备注" class="layui-input">
	    </div>
	  </div>
	  <button class="layui-btn layui-btn-small bcql-icon icon-save" id="formDemo1" lay-submit lay-filter="formDemo1" style="display: none;"></button>
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
    	"staffid"  : "${staff.staffid}",
		"name"  : "${staff.name}",
		 "sex" : "${staff.sex}",
		 "diploma"  : "${staff.diploma}",
		 "salary"  : "${staff.salary}",
		 "phone": "${staff.phone}",
		 "address"  : "${staff.address}",
		 "idcard": "${staff.idcard}",
		 "other"  : "${staff.other}"
    });
    //绑定时间
    laydate.render({ 
    	  elem: '#begindate'
    	  ,value: new Date("${staff.begindate}")
    	});

</script>
</body>
</html>