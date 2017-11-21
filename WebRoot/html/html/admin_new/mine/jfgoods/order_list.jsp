<%@ page import="com.jfinal.kit.PropKit"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>订单列表</title>
   	<jsp:include page="../../meta.jsp"></jsp:include>    
</head>

<body class="gray-bg">
    <div class="wrapper wrapper-content animated fadeInRight">
        <div class="row">
            <div class="col-sm-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-content">
                        <table id="list_table" class="table table-striped table-bordered table-hover">
                            <thead>
                                <tr>
					                <th width="200">商品名称</th>
					                <th width="50">积分</th>
					                <th width="50">价格</th>
					                <th width="50">数量</th>
					                <th width="200">领取门店</th>
					                <th width="80">订单状态</th>
					                <th width="100">购买用户</th>
					                <th width="100">订单号</th>
					                <th width="80">手寸型号</th>
					                <th width="50">操作</th>
                                </tr>
                            </thead>
                            <tbody>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <jsp:include page="../../footer.jsp"></jsp:include>
    <script type="text/javascript">
    	var datatable = null;
		$(".abcfancybox").fancybox({openEffect:"none",closeEffect:"none"});
        $(document).ready(function(){
        	//提示信息
            //初始化表格
            datatable = $("#list_table").dataTable({
                language:datatablelang,  //提示信息
                lengthChange: false,
                ordering: false,
                autoWidth: false,  //禁用自动调整列宽
                processing: false,  //隐藏加载提示,自行处理
                serverSide: true,  //启用服务器端分页
                searching: false,  //禁用原生搜索
                orderMulti: false,  //启用多列排序
                order: [],  //取消默认排序查询,否则复选框一列会出现小箭头
                renderer: "bootstrap",  //渲染样式：Bootstrap和jquery-ui
                pagingType: "simple_numbers",  //分页样式：simple,simple_numbers,full,full_numbers
                ajax: function (data, callback, settings) {
                    //封装请求参数
                    var param = {};
                    param.limit = data.length;//页面显示记录条数，在页面显示每页显示多少项的时候
                    param.start = data.start;//开始的记录序号
                    param.page = (data.start / data.length)+1;//当前页码
                    //console.log(param);
                    //ajax请求数据
                    $.ajax({
                        type: "GET",
                        url: "/<%=PropKit.get("project_name") %>/admin_new/mine/jfgoods/order/list_json",
                        cache: false,  //禁用缓存
                        data: param,  //传入组装的参数
                        dataType: "json",
                        success: function (result) {
                            //console.log(result);
                            //setTimeout仅为测试延迟效果
                            setTimeout(function () {
                                //封装返回数据
                                var returnData = {};
                                returnData.draw = data.draw;//这里直接自行返回了draw计数器,应该由后台返回
                                returnData.recordsTotal = result.total;//返回数据全部记录
                                returnData.recordsFiltered = result.total;//后台不实现过滤功能，每次查询均视作全部结果
                                returnData.data = result.data;//返回的数据列表
                                for (var i = 0; i < returnData.data.length; i ++) {
                                	
                                	var scxh = '';
                                	if ($.isEmptyObject(returnData.data[i].scxh)) {
                                		scxh = '/';
                                	}
                                	returnData.data[i].scxh = scxh;
                                	
                                	var optContent = '';
                                	if (returnData.data[i].orderstate == -2) {
                                		optContent += '<td>\n';
	                                	optContent += '<div class="btn-group">\n';
	                                	optContent += '<button data-toggle="dropdown" class="btn btn-primary btn-xs dropdown-toggle">操作 <span class="caret"></span></button>\n';
	                                	optContent += '<ul class="dropdown-menu">\n';
	                                	optContent += '<li><a onclick="del('+returnData.data[i].id+')" href="javascript:;">删除</a></li>\n';
	                                	optContent += '</ul>\n';
	                                	optContent += '</div>\n';
	                                	optContent += '</td>\n';
                                	} else if (returnData.data[i].orderstate == -1) {
                                		optContent += '<td>\n';
	                                	optContent += '<div class="btn-group">\n';
	                                	optContent += '<button data-toggle="dropdown" class="btn btn-primary btn-xs dropdown-toggle">操作 <span class="caret"></span></button>\n';
	                                	optContent += '<ul class="dropdown-menu">\n';
	                                	optContent += '<li><a onclick="del('+returnData.data[i].id+')" href="javascript:;">删除</a></li>\n';
	                                	optContent += '</ul>\n';
	                                	optContent += '</div>\n';
	                                	optContent += '</td>\n';
                                	} else if (returnData.data[i].orderstate == 0) {
                                		
                                	} else if (returnData.data[i].orderstate == 1) {
                                		optContent += '<td>\n';
	                                	optContent += '<div class="btn-group">\n';
	                                	optContent += '<button data-toggle="dropdown" class="btn btn-primary btn-xs dropdown-toggle">操作 <span class="caret"></span></button>\n';
	                                	optContent += '<ul class="dropdown-menu">\n';
	                                	optContent += '<li><a onclick="change_state('+returnData.data[i].id+', 2)" href="javascript:;">设为已配送</a></li>\n';
	                                	optContent += '</ul>\n';
	                                	optContent += '</div>\n';
	                                	optContent += '</td>\n';
                                	} else if (returnData.data[i].orderstate == 2) {
                                		optContent += '<td>\n';
	                                	optContent += '<div class="btn-group">\n';
	                                	optContent += '<button data-toggle="dropdown" class="btn btn-primary btn-xs dropdown-toggle">操作 <span class="caret"></span></button>\n';
	                                	optContent += '<ul class="dropdown-menu">\n';
	                                	optContent += '<li><a onclick="change_state('+returnData.data[i].id+', 3)" href="javascript:;">设为已到店</a></li>\n';
	                                	optContent += '</ul>\n';
	                                	optContent += '</div>\n';
	                                	optContent += '</td>\n';
                                	} else if (returnData.data[i].orderstate == 3) {
                                		optContent += '<td>\n';
	                                	optContent += '<div class="btn-group">\n';
	                                	optContent += '<button data-toggle="dropdown" class="btn btn-primary btn-xs dropdown-toggle">操作 <span class="caret"></span></button>\n';
	                                	optContent += '<ul class="dropdown-menu">\n';
	                                	optContent += '<li><a onclick="change_state('+returnData.data[i].id+', 4)" href="javascript:;">设为已领取</a></li>\n';
	                                	optContent += '</ul>\n';
	                                	optContent += '</div>\n';
	                                	optContent += '</td>\n';
                                	} else if (returnData.data[i].orderstate == 4) {
                                	}
                                	returnData.data[i].opt = optContent;
                                	
                                	//-1支付失败 0待付款 1待发放 2已发放 3已到店 4已领取
                                	var orderstate = '';
                                	if (returnData.data[i].orderstate == -2) {
                                		orderstate = '支付过期';
                                	} else if (returnData.data[i].orderstate == -1) {
                                		orderstate = '支付失败';
                                	} else if (returnData.data[i].orderstate == 0) {
                                		orderstate = '未支付';
                                	} else if (returnData.data[i].orderstate == 1) {
                                		orderstate = '已支付';
                                	} else if (returnData.data[i].orderstate == 2) {
                                		orderstate = '已配送';
                                	} else if (returnData.data[i].orderstate == 3) {
                                		orderstate = '已到店';
                                	} else if (returnData.data[i].orderstate == 4) {
                                		orderstate = '已领取';
                                	}
                                	returnData.data[i].orderstate = orderstate;
                                }
                                //console.log(returnData);
                                //调用DataTables提供的callback方法，代表数据已封装完成并传回DataTables进行渲染
                                //此时的数据需确保正确无误，异常判断应在执行此回调前自行处理完毕
                                callback(returnData);
                            }, 200);
                        }
                    });
                },
                //列表表头字段
                columns: [
					{ "data": "jfgoodsname" },
					{ "data": "jf" },
					{ "data": "price" },
					{ "data": "num" },
					{ "data": "shopname" },
					{ "data": "orderstate" },
					{ "data": "nickname" },
					{ "data": "orderno" },
					{ "data": "scxh" },
					{ "data": "opt" }
                ]
            }).api();
            //此处需调用api()方法,否则返回的是JQuery对象而不是DataTables的API对象
        });
		
		function change_state(id, state) {
			var params = {};
			params.id = id;
			params.state = state;
			$.post('/<%=PropKit.get("project_name") %>/admin_new/mine/jfgoods/order/change_state', params, function(returnJson) {
    			var rescode = returnJson.rescode;
    			var rescnt = returnJson.rescnt;
    			if (rescode == '0000') {
    				datatable.ajax.reload();
    			}
    		});
		}
		
		function del(id) {
			swal({
		        title: "确认删除?",
		        showCancelButton: true,
		        confirmButtonColor: "#DD6B55",
		        confirmButtonText: "删除",
		        cancelButtonText: "取消",
		        closeOnConfirm: true
		    }, function () {
		    	$.post('/<%=PropKit.get("project_name") %>/admin_new/mine/jfgoods/order/del', {id:id}, function(returnJson) {
	    			var rescode = returnJson.rescode;
	    			var rescnt = returnJson.rescnt;
	    			if (rescode == '0000') {
	    				datatable.ajax.reload();
	    			}
	    		});
		    });
		}
	</script>
    
</body>
</html>
