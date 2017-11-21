<%@ page import="com.jfinal.kit.PropKit"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>类别商品列表</title>
   	<jsp:include page="../../meta.jsp"></jsp:include>    
</head>

<body class="gray-bg">
    <div class="wrapper wrapper-content animated fadeInRight">
        <div class="row">
            <div class="col-sm-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-content">
                    	<div class="">
                            <a href="javascript:;" onclick="addJfGoods();" class="btn btn-primary ">添加积分商品</a>
                            <a href="javascript:;" onclick="back();" class="btn btn-outline btn-default">返回</a>
                        </div>
                        <table id="list_table" class="table table-striped table-bordered table-hover">
                            <thead>
                                <tr>
					                <th>名称</th>
					                <th width="100">积分</th>
					                <th width="200">价格</th>
					                <th width="100">已兑换</th>
					                <th width="100">总库存</th>
					                <th width="200">图片</th>
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
    <input type="hidden" id="topicsid" value="${topicsid }">
    <jsp:include page="../../footer.jsp"></jsp:include>
    <script type="text/javascript">
    $(".abcfancybox").fancybox({openEffect:"none",closeEffect:"none"});
    	var datatable = null;
		$(document).ready(function(){
			
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
	                   param.topicsid = $('#topicsid').val();
	                   param.limit = data.length;//页面显示记录条数，在页面显示每页显示多少项的时候
	                   param.start = data.start;//开始的记录序号
	                   param.page = (data.start / data.length)+1;//当前页码
	                   //console.log(param);
	                   //ajax请求数据
	                   $.ajax({
	                       type: "GET",
	                       url: "/<%=PropKit.get("project_name") %>/admin_new/mine/jfgoods/topics/jfgoods_list_json",
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
					{ "data": "name" },
					{ "data": "jf" },
					{ "data": "price" },
					{ "data": "dhnum" },
					{ "data": "kucun" },
					{ "data": "imgpath" }
	               ]
	           }).api();
		});
		
		function addJfGoods() {
			
			var params = {};
			params.topicsid = $('#topicsid').val();
			$.post('/<%=PropKit.get("project_name") %>/admin_new/mine/jfgoods/topics/add_jfgoods_list', params, function(returnJson) {
    			var rescode = returnJson.rescode;
    			var rescnt = returnJson.rescnt;
    			var content = '';
    			if (rescode == '0000') {
    				content += '<table id="topics_popup_list_table" class="table table-striped table-bordered table-hover">\n';
    				content += '<thead>\n';
    				content += '<tr>\n';
    				content += '<th width="20"><input id="all_checkbox" type="checkbox" onclick="check_all()" /></th>\n';
    				content += '<th>名称</th>\n';
    				content += '</tr>\n';
    				content += '</thead>\n';
    				content += '<tbody>\n';
    				$.each(rescnt, function(index, cnt) {
    					content += '<tr>\n';
    					if (cnt.ishave == 1) {
    						content += '<td><input name="jfgoods_checkbox" checked type="checkbox" value="'+cnt.id+'" /></td>\n';
    					} else {
    						content += '<td><input name="jfgoods_checkbox" type="checkbox" value="'+cnt.id+'" /></td>\n';
    					}
    					content += '<td>'+cnt.name+'</td>\n';
    					content += '</tr>\n';
    				});
    				content += '</tbody>\n';
    				content += '</table>\n';
    			}
    			layer.open({
    				title: '积分商品列表',
				    type: 1,
				    skin: 'layui-layer-molv', //样式类名
				    closeBtn: false, 
				    area: ['500px', '300px'],
				    shadeClose: true, //开启遮罩关闭
				    btn: ['确定'],
				    content: content,
				    yes: function(index, layero){
						// 第一个按钮回调
						var ids = '';
						$('#topics_popup_list_table input[name="jfgoods_checkbox"]:checked').each(function() {
							ids += $(this).val() + '|';
						});
						var params1 = {};
						params1.ids = ids;
						params1.topicsid = $('#topicsid').val();
						$.post('/<%=PropKit.get("project_name") %>/admin_new/mine/jfgoods/topics/jfgoods2topics_submit', params1, function(returnJson) {
							datatable.ajax.reload();
						});
						layer.close(index);
					}
				});
    		});
		}
		

		function check_all() {
			//
			var ischecked = 0;
			$("#topics_popup_list_table #all_checkbox:checked").each(function () {
				ischecked = 1;
            });
			if (ischecked == 1) {
				$('#topics_popup_list_table input[name="jfgoods_checkbox"]').each(function() {
					$(this).prop('checked', true);
				});
			} else {
				$('#topics_popup_list_table input[name="jfgoods_checkbox"]').each(function() {
					$(this).prop('checked', false);
				});
			}
		}
	</script>
    
</body>
</html>
