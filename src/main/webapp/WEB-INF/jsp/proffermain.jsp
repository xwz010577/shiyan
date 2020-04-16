<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>供应商管理界面</title>
<link rel="stylesheet" href="layui/css/layui.css">
</head>
<body>

<!-- 供应商数据表格 -->
<div class="layui-body">
    <!-- 内容主体区域 -->
    <div style="padding: 15px;">
   	<div class="demoTable">
   	<form class="layui-form" style="width:110px; float:left;">
  			<select name="condition" id="condition">
  				<option value="profferid">供应商编号</option>
  				<option value="fullname">名称</option>
  				<option value="contactperson">联系人</option>
  				<option value="phone">联系电话</option>
  				<option value="address">联系地址</option>
  				<option value="openingbank">开户行</option>
  				<option value="accountid">银行账号</option>
  			</select>
  		</form>
  		<div class="layui-inline">
    		<input class="layui-input" name="id" id="demoReload" autocomplete="off">
  		</div>
 		 <button class="layui-btn" id="reload" data-type="reload">搜索</button>
	    <button id="add" class="layui-btn" lay-submit="" lay-filter="pageSubmit">新增</button>
    </div>
    	<table id="demo"  lay-filter="test">
    	</table>
    	<script type="text/html" id="barDemo">
   			 <a class="layui-btn layui-btn-xs layui-btn-mini" lay-event="edit">编辑</a>
  			 <a class="layui-btn layui-btn-xs layui-btn-danger layui-btn-mini" lay-event="del">删除</a>
		</script>
    	
    </div>
  </div>
  <script src="layui/layui.all.js"></script>
<script>
    //JavaScript代码区域
        var element = layui.element;
        var form = layui.form;
        var table=layui.table;
        var layer=layui.layer;
        var $=layui.jquery;
      //执行一个 table 实例
		table.render({
			//绑定body里面的table标签，通过id
			elem: '#demo',
			//table表格的高度
			height: 523,
			//请求后台的地址
			url: '/ww.market/toSelectAllProffer' //数据接口
				,
		    //表格的名称
			title: '用户表',
			//开启分页
			page: true 
				,
			//开启工具栏，此处显示默认图标，可以自定义模板，详见文档
			toolbar: 'true' 
				,
				response: {
				    statusName: 'code' //规定数据状态的字段名称，默认：code
				    ,statusCode: 0 //规定成功的状态码，默认：0
				    ,msgName: 'msg' //规定状态信息的字段名称，默认：msg
				    ,countName: 'count' //规定数据总数的字段名称，默认：count
				    ,dataName: 'data' //规定数据列表的字段名称，默认：data
				  }
		,
            parseData: function(res){ //res 即为原始返回的数据
                    return {
                         	"code": res.code, //解析接口状态，0显示数据，其他 显示提示文本
                             "msg": res.msg, //解析提示文本,如数据没有时
                             "count": res.count, //解析数据长度
                              "data": res.data //解析数据列表
                       };
                  },

            //解析后台的数据
			cols: [[
					{field:'profferid', title: '供货编号'},
					{field:'fullname', title: '名称'},
					{field:'contactperson', title: '联系人'},
					{field:'phone', title: '联系电话'},
					{field:'address', title: '联系地址'},
					{field:'openingbank', title: '开户行'},
					{field:'accountid', title: '银行账号'},
					{field:'other', title: '备注'},
					{fixed: 'right', title: '操作', width:150,toolbar:"#barDemo"}
	        	       ]
	        	],
	        	id: 'testReload1'
		});
		/* 搜索 */
		var active = {
    		reload: function(){
      		var demoReload = $('#demoReload').val();
      		var condition=$('#condition').val();
      		var profferid=null,fullname=null,contactperson=null,phone=null
      			,address=null,openingbank=null,accountid=null;
      		 switch(condition){
      			case 'profferid':   profferid=demoReload;break;
      			case 'fullname':   fullname=demoReload;break;
      			case 'contactperson':  contactperson=demoReload;break;
      			case 'phone':   phone=demoReload;break;
      			case 'address':   address=demoReload;break;
      			case 'openingbank':  openingbank=demoReload;break;
      			case 'accountid':  accountid=demoReload;break;
      		}; 
     		 //执行重载
      		table.reload('testReload1', {
      			  page: {
       				   curr: 1 //重新从第 1 页开始
      			  }
     		   ,where: {
     			   profferid:profferid,
     			  fullname:fullname,
     			  contactperson :contactperson,
   				  phone :phone,
   				  address :address,
   				  openingbank :openingbank,
   				  accountid :accountid
      	 		 }
     		 });
 	   }
 	 };
		
  	$('.demoTable .layui-btn').on('click', function(){
    	var type = $(this).data('type');
   	 	active[type] ? active[type].call(this) : '';
  	});
  	/* 新增 */
    $("#add").click(function(){
		  layer.open({
			  type: 2, 
			  title:["添加新供应商","font-size:18px;text-align:center;"],
			  area:['600px','76%'],
			   btn: ['确定添加', '取消'],  
			  shadeClose: true, //开启遮罩关闭
			  content:  '/ww.market/toinsertProfferBill' ,/* '/ww.market/toinsertStaffBill',$("#window") */
			   success:function(layero,index){
				  layero.find('.layui-layer-btn0').attr({
                   'lay-filter': '*p',
                   'lay-submit':'',
                   'for':'proff'
               });
               form.render();
			  },
			  yes:function(index,layero){
				  var iframeWindow = window['layui-layer-iframe'+ index]
		            ,submitID = 'formDemo1'//按钮的id 和layfiler
		            ,submit = layero.find('iframe').contents().find('#'+ submitID);
					
		            //监听提交
		            iframeWindow.layui.form.on('submit('+ submitID +')', function(data){
		              var field = data.field; //获取提交的字段
		              $.ajax({
			        		url:'/ww.market/toInsertProffer',
			        		type:'post',
			        		datatype:'json',
			        		data:field,
			        		success:function(data){
			        			if(data>0){
			              			  layer.alert('增加成功',{icon:1,title:'提示'},function(i){
			              				  layer.close(i);
			                                layer.close(index);//关闭弹出层
			                                $("#proff")[0].reset()//重置form
			              			  })
			              			  table.reload('testReload1',{//重载表格
			              				  page:{
			              					  curr:1
			              				  }
			              			  })
			              		  }else{
			              			layer.alert('已存在',{icon:1,title:'提示'},function(i){
			              				  layer.close(i);
			                                layer.close(index);//关闭弹出层
			                                $("#proff")[0].reset()//重置form
			              			  })
			              		  }
			        		}
			        	 });
		              table.reload('testReload1',{//重载表格
          				  page:{
          					  curr:1
          				  }
          			  })
		              layer.close(index); //关闭弹层
		            });  
		            submit.trigger('click');
			  } 
			}); 
	  })
	  
	//监听行工具事件  编辑和删除
	  table.on('tool(test)', function(obj){ 
	    var data = obj.data //获得当前行数据
	    ,layEvent = obj.event; //获得 lay-event 对应的值
	    if(layEvent === 'del'){
	      layer.confirm('真的删除行么', function(index){
	        layer.close(index);
	        //向服务端发送删除指令
	        var profferid=data.profferid;
	        $.ajax({
	        	url:'/ww.market/toDelProffer',
        		type:'post',
        		datatype:'json',
        		data:{
        			profferid:profferid
        		},
        		success:function(data){
        			if(data>0){
        				obj.del(); //删除对应行（tr）的DOM结构
        				layer.msg("删除成功！！！");
        			}else
        				layer.msg("删除失败！！！");
        		}
	        });
	      });
	    } else if(layEvent === 'edit'){
	    	layer.open({
				  type: 2, 
				  title:["添加供应商信息","font-size:18px;text-align:center;"],
				  area:['600px','76%'],
				   btn: ['确定修改', '取消'],  
				  shadeClose: true, //开启遮罩关闭
				  content:  '/ww.market/toupdateProfferBill?profferid='+data.profferid,/* '/ww.market/toinsertStaffBill',$("#window") */
				   success:function(layero,index){
					  layero.find('.layui-layer-btn0').attr({
	                      'lay-filter': '*',
	                      'lay-submit':'',
	                      'for':'proff'
	                  });
	                  form.render();
				  },
				  yes:function(index,layero){
					  
					  var iframeWindow = window['layui-layer-iframe'+ index]
			            ,submitID = 'formDemo'
			            ,submit = layero.find('iframe').contents().find('#'+ submitID);

			            //监听提交
			            iframeWindow.layui.form.on('submit('+ submitID +')', function(data){
			              var field = data.field; //获取提交的字段
			              
			              //提交 Ajax 成功后，静态更新表格中的数据
			                $.ajax({
				        		url:'/ww.market/toEditProffer',
				        		type:'post',
				        		datatype:'json',
				        		data:field,
				        		success:function(data){
				        			if(data>0){
				              			  layer.alert('修改成功',{icon:1,title:'提示'},function(i){
				              				  layer.close(i);
				                                layer.close(index);//关闭弹出层
				                                $("#staff1")[0].reset()//重置form
				              			  })
				              			$(".layui-laypage-btn").click();
				              		  }
				        		}
				        	 }); 
			            });  
			            submit.trigger('click');
				  } 
				});
	    }
	  });
    </script>
</body>
</html>