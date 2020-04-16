<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>库存信息展示</title>
<link rel="stylesheet" href="layui/css/layui.css">
<link rel="stylesheet" href="css/soulTable.css">
</head>
<body>
<div class="layui-row">
    <div class="layui-col-xs6">
	<!-- 库存数据表格 -->
		<!-- 内容主体区域 -->
    <div style="padding: 15px; padding-top: 50px;padding-left: 70px;">
    <h1 style="text-align: center;">库存管理</h1><hr class="layui-bg-black">
   	<div class="demoTable">
  		搜索ID：
  		<div class="layui-inline">
    		<input class="layui-input" name="id" id="demoReload" autocomplete="off">
  		</div>
 		 <button class="layui-btn" id="reload" data-type="reload">搜索</button>
	    <button id="add" class="layui-btn" lay-submit="" lay-filter="pageSubmit">导入进货信息</button>
    </div>
    	<table id="demo"  lay-filter="test"></table>
    	<%-- <c:if test="false"></c:if> --%>
    	<script type="text/html" id="barDemo">
   			  <a class="layui-btn layui-btn-xs layui-btn-danger layui-btn-mini" lay-event="del">删除</a>
		</script>
    </div>

    </div>
    <div class="layui-col-xs6">
    	<div class="layui-layout-body" style="padding-top: 50px;">
    	<h1 style="text-align: center;">商品信息展示</h1><hr class="layui-bg-black">
    		<table id="demo1" lay-filter="test1"></table>
    	</div>
     	
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
			height: 480,
			//请求后台的地址
			url: '/ww.market/toSelectAllstore' //数据接口
				,
		    //表格的名称
			title: '库存信息表',
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
                                {field:'merchid', title: '商品编号(点击即可展示详细商品)',event: 'merchid'},
                                {field:'merchbill.fullname',templet:'<div>{{d.merchbill.fullname}}</div>', title: '商品名称'},
              					{field:'storenum', title: '库存数量',width:150},
              					{fixed: 'right', title: '操作', width:150,toolbar:"#barDemo"}
                                      
	        	       ]],
	        	id: 'testReload'
		});
		/* 搜索 */
		var active = {
    		reload: function(){
      		var demoReload = $('#demoReload').val();
     		 //执行重载
      		table.reload('testReload', {
      			  page: {
       				   curr: 1 //重新从第 1 页开始
      			  }
     		   ,where: {
     			  storeid: demoReload
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
    		  content: '确定导入进货信息'
    		  ,btn: ['确定导入', '取消']
    		  ,yes: function(index, layero){
    			  $.ajax({
		        		url:'/ww.market/todrstore',
		        		type:'post',
		        		datatype:'json',
		        		success:function(data){
		        			if(data!="false"){
		              			  layer.alert('增加成功',{icon:1,title:'提示'},function(i){
		              				  layer.close(i);
		                                layer.close(index);//关闭弹出层
		              			  })
		              			$(".layui-laypage-btn").click();
		              		  }else{
		              			layer.alert('没有进货信息',{icon:2,title:'提示'},function(i){
		              				  layer.close(i);
		                                layer.close(index);//关闭弹出层
		              			  })
		              		  }
		        		}
		        	 });
    		  }
    		  ,btn2: function(index, layero){
    			  layer.close(index);
    		  }
    		});
	  })
	  //加载现有商品信息
	  var datamerch=[],i=-1;
  	//判断a对象中是否又b
    function pdmerchid(b){
		for(j = 0; j <= i; j++) {
			if(b===datamerch[j]['merchid']){
				return false;
			}
		}
		return true;
	}
  	//重载商品数据表格
  	function toinsertmerch(data){
  		datamerch.unshift({
			'merchid':data.merchid,
			'profferid':data.profferid,
			'fullname':data.fullname,
			'kind':data.kind,
			'birthplace':data.birthplace,
			'unitcost':data.unitcost,
			'other':data.other
			
		});
		i++;
		table1(datamerch);
  	}
    //加载静态商品表格
  	function table1(datamerch){
    table.render({
		//绑定body里面的table标签，通过id
		elem: '#demo1',
		//table表格的高度
		height: 523,
		
	    //表格的名称
		title: '用户表',
		//开启分页
		page: {
			limit:10
		} 
			,
		//开启工具栏，此处显示默认图标，可以自定义模板，详见文档
		toolbar: 'true' 
			 ,
        //解析后台的数据
		cols: [[
				{field:'merchid', title: '商品编号'},
				{field:'profferid', title: '供货商号'},
				{field:'fullname', title: '名称'},
				{field:'kind', title: '类别'},
				{field:'birthplace', title: '产地'},
				{field:'unitcost', title: '单价'},
				{field:'other', title: '备注'}
        	       ]
        	],
        	data:datamerch,
        	id: 'testReload1'
	});
  	}
	//监听行工具事件  编辑和删除
	  table.on('tool(test)', function(obj){ 
	    var data = obj.data //获得当前行数据
	    ,layEvent = obj.event; //获得 lay-event 对应的值
	    if(layEvent === 'del'){
	      layer.confirm('真的删除行么', function(index){
	        layer.close(index);
	        //向服务端发送删除指令
	        var merchid=data.merchid;
	        $.ajax({
	        	url:'/ww.market/toDelstore',
        		type:'post',
        		datatype:'json',
        		data:{
        			merchid:merchid
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
	    } else if(layEvent === 'merchid'){
	    	var merchid=data.merchid;
	    	$.ajax({
	    		url:'/ww.market/tostoremerchid',
        		type:'post',
        		datatype:'json',
        		data:{
        			merchid:merchid
        		},
        		success:function(data){
        			if(data!=null){
        				if(i>=0){
        					if(pdmerchid(data.merchid)){
        						toinsertmerch(data);
        					}
        				}else{
        					toinsertmerch(data);
        				}
        			}
        		}
	    		
	    	});

	    }
	  });
	
    </script>
</body>
</html>