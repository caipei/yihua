<%@page import="com.jfinal.kit.PropKit"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>参加人员列表</title>
   	<jsp:include page="../meta.jsp"></jsp:include>    
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
                                    <th>姓名</th>
                                    <th>电话</th>
                                    <th>类型</th>
                                    <th>奖品</th>
                                    <th>优惠券</th>
                                    <th>门店信息</th>
                                    <th>邀请人数</th>
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
    <jsp:include page="../footer.jsp"></jsp:include>
	<script>
        $(document).ready(function(){
        	var lang = {
                    "sProcessing": "处理中...",
                    "sLengthMenu": "每页 _MENU_ 项",
                    "sZeroRecords": "没有匹配结果",
                    "sInfo": "当前显示第 _START_ 至 _END_ 项，共 _TOTAL_ 项。",
                    "sInfoEmpty": "当前显示第 0 至 0 项，共 0 项",
                    "sInfoFiltered": "(由 _MAX_ 项结果过滤)",
                    "sInfoPostFix": "",
                    "sSearch": "搜索:",
                    "sUrl": "",
                    "sEmptyTable": "表中数据为空",
                    "sLoadingRecords": "载入中...",
                    "sInfoThousands": ",",
                    "oPaginate": {
                        "sFirst": "首页",
                        "sPrevious": "上页",
                        "sNext": "下页",
                        "sLast": "末页",
                        "sJump": "跳转"
                    },
                    "oAria": {
                        "sSortAscending": ": 以升序排列此列",
                        "sSortDescending": ": 以降序排列此列"
                    }
                };
                //初始化表格
                datatable = $("#list_table").dataTable({
                    language:lang,  //提示信息
                    lengthChange: false,
                    ordering: false,
                    autoWidth: false,  //禁用自动调整列宽
                    processing: true,  //隐藏加载提示,自行处理
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
                            url: "/<%=PropKit.get("project_name") %>/admin_new/huodong/member_list_json",
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
                        { "data": "nickname" },
                        { "data": "mobile" },
                        { "data": "vipflag" },
                        { "data": "prizename" },
                        { "data": "couponname" },
                        { "data": "shopname" },
                        { "data": "memcount" }
                    ]
                }).api();
        });
    </script>
</body>
</html>
