<%@ page import="com.jfinal.kit.PropKit"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>会员专属活动列表</title>
   	<jsp:include page="../../meta.jsp"></jsp:include>    
</head>

<body class="gray-bg">
    <div class="wrapper wrapper-content animated fadeInRight">
        <div class="row">
            <div class="col-sm-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-content">
                    	<div class="">
                            <a href="/<%=PropKit.get("project_name") %>/admin_new/mine/hyzshd/add" class="btn btn-primary ">新增</a>
                        </div>
                        <table id="list_table" class="table table-striped table-bordered table-hover">
                            <thead>
                                <tr>
					                <th>标题</th>
					                <th width="200">开始时间</th>
					                <th width="200">结束时间</th>
					                <th width="200">图片</th>
					                <th width="100">操作</th>
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
		$(document).ready(function(){
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
	                        url: "/<%=PropKit.get("project_name") %>/admin_new/mine/hyzshd/list_json",
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
	                                	
	                                	var optContent = '';
	                                	optContent += '<td>\n';
	                                	optContent += '<div class="btn-group">\n';
	                                	optContent += '<button data-toggle="dropdown" class="btn btn-primary btn-xs dropdown-toggle">操作 <span class="caret"></span></button>\n';
	                                	optContent += '<ul class="dropdown-menu">\n';
	                                	optContent += '<li><a onclick="edit('+returnData.data[i].id+')" href="javascript:;">编辑</a></li>\n';
	                                	optContent += '<li class="divider"></li>\n';
	                                	optContent += '<li><a onclick="del('+returnData.data[i].id+')" href="javascript:;">删除</a></li>\n';
	                                	optContent += '</ul>\n';
	                                	optContent += '</div>\n';
	                                	optContent += '</td>\n';
	                                	returnData.data[i].opt = optContent;
	                                	
	                                	var imgpathContent = '<td><a class="abcfancybox" href="'+returnData.data[i].imgpath+'"><img src="'+returnData.data[i].imgpath+'" style="max-width:100px; max-height:100px;" /></a></td>';
	                                	returnData.data[i].imgpath = imgpathContent;
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
						{ "data": "title" },
						{ "data": "starttime" },
						{ "data": "endtime" },
						{ "data": "imgpath" },
						{ "data": "opt" }
	                ]
	            }).api();
	            //此处需调用api()方法,否则返回的是JQuery对象而不是DataTables的API对象
	        });
		});
		
		function edit(id) {
			window.location.href = '/<%=PropKit.get("project_name") %>/admin_new/mine/hyzshd/edit?id=' + id;
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
		    	$.post('/<%=PropKit.get("project_name") %>/admin_new/mine/hyzshd/del', {id:id}, function(returnJson) {
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
