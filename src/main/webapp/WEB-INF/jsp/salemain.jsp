<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>销售信息展示</title>
<link rel="stylesheet" href="layui/css/layui.css">
<script type="text/javascript" src="js/chart.min.js"></script>
</head>
<body>
	<div class="layui-col-xs5" style="margin-top: 20px;">
      <!-- 销售数据表格 -->
      <!-- 内容主体区域 -->
      <div style="padding: 15px; padding-top: 50px;padding-left: 70px;">
   	<div class="demoTable">
  		搜索ID：
  		<div class="layui-inline">
    		<input class="layui-input" name="id" id="demoReload" autocomplete="off">
  		</div>
 		 <button class="layui-btn" id="reload" data-type="reload">搜索</button>
	    <button id="add" class="layui-btn" lay-submit="" lay-filter="pageSubmit">模拟增加销售信息</button>
    </div>
    	<table id="demo"  lay-filter="test"></table>
    	<%-- <c:if test="false"></c:if> --%>
    	<script type="text/html" id="barDemo">
   			  <a class="layui-btn layui-btn-xs layui-btn-danger layui-btn-mini" lay-event="del">删除</a>
		</script>
    </div>
    </div>
    <div class="layui-col-xs7">
    	<div class="layui-layout-body" style="padding-top: 50px;">
      		<h1 style="text-align: center;">销售情况统计与分析</h1><hr class="layui-bg-black">
      		<div style="margin:0px auto">
		    <canvas id="myChart" ></canvas>
		</div>
      	</div>
    </div>
    <!-- 销售情况统计与分析 -->
    <script type="text/javascript">
    /* ${sessionScope.salebillsp} */
    var la=[];
	var sum=[];
	//获取商品销售数据
	var list= '${sessionScope.salebillsp}';
	list = eval(list);
	//加载现有商品信息
	  var datamerch=[],i=list.length;
	  for(j = 0; j <i; j++) {
			la.push(list[j]['merchbill']['fullname']);
			sum.push(list[j]['salenum']);
		}
	  //绘图
    var ctx = document.getElementById('myChart').getContext('2d');
	var myChart = new Chart(ctx, {
    type: 'bar',
    data: {
        labels: la,
        datasets: [{
            label: '销售情况统计分析',
            data: sum,
            borderColor:'blue',
            backgroundColor:'skyBlue',
            borderWidth: 1,
        }]
    }
});
    
    </script>
    
    
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
			url: '/ww.market/toSelectAllsale' //数据接口
				,
		    //表格的名称
			title: '销售信息表',
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
					{field:'salebillid', title: '销售单号'},
					{field:'merchbill.fullname',templet:'<div>{{d.merchbill.fullname}}</div>', title: '商品名称'},
					{field:'salenum', title: '销售数量'},
					{field:'saledate', title: '销售日期',
						templet:"<div>{{layui.util.toDateString(d.saledate, 'yyyy-MM-dd HH:mm:ss')}}</div>"},
					{fixed: 'right', title: '操作', width:150,toolbar:"#barDemo"}
	        	       ]
	        	],
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
     			  saleid: demoReload
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
			  title:["添加新销售信息","font-size:18px;text-align:center;"],
			  area:['600px','76%'],
			   btn: ['确定添加', '取消'],  
			  shadeClose: true, //开启遮罩关闭
			  content:  '/ww.market/toinsertSaleBill' ,
			   success:function(layero,index){
				  layero.find('.layui-layer-btn0').attr({
                   'lay-filter': '*p',
                   'lay-submit':'',
                   'for':'importbill'
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
			        		url:'/ww.market/toInsertsale',
			        		type:'post',
			        		datatype:'json',
			        		data:field,
			        		success:function(data){
			        			if(data>0){
			              			  layer.alert('增加成功',{icon:1,title:'提示'},function(i){
			              				  layer.close(i);
			                                layer.close(index);//关闭弹出层
			                                $("#import")[0].reset()//重置form
			              			  })
			              			  table.reload('testReload',{//重载表格
			              				  page:{
			              					  curr:1
			              				  }
			              			  })
			              		  }else{
			              			layer.alert('已存在',{icon:1,title:'提示'},function(i){
			              				  layer.close(i);
			                                layer.close(index);//关闭弹出层
			                                $("#salebill")[0].reset()//重置form
			              			  })
			              		  }
			        		}
			        	 });
		              table.reload('testReload',{//重载表格
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
	        var salebillid=data.salebillid;
	        $.ajax({
	        	url:'/ww.market/toDelSale',
        		type:'post',
        		datatype:'json',
        		data:{
        			saleid:salebillid
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
				  title:["编辑销售信息","font-size:18px;text-align:center;"],
				  area:['600px','76%'],
				   btn: ['确定修改', '取消'],  
				  shadeClose: true, //开启遮罩关闭
				  content:  '/ww.market/toupdateImportBill?importid='+data.imortbillid,
				   success:function(layero,index){
					  layero.find('.layui-layer-btn0').attr({
	                      'lay-filter': '*',
	                      'lay-submit':'',
	                      'for':'salebill'
	                  });
	                  form.render();
				  },
				  yes:function(index,layero){
					  
					  var iframeWindow = window['layui-layer-iframe'+ index]
			            ,submitID = 'formDemo1'
			            ,submit = layero.find('iframe').contents().find('#'+ submitID);

			            //监听提交
			            iframeWindow.layui.form.on('submit('+ submitID +')', function(data){
			              var field = data.field; //获取提交的字段
			              
			              //提交 Ajax 成功后，静态更新表格中的数据
			                $.ajax({
				        		url:'/ww.market/toEditImport',
				        		type:'post',
				        		datatype:'json',
				        		data:field,
				        		success:function(data){
				        			if(data>0){
				              			  layer.alert('修改成功',{icon:1,title:'提示'},function(i){
				              				  layer.close(i);
				                                layer.close(index);//关闭弹出层
				                                $("#salebill")[0].reset()//重置form
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