<%@page import="com.jfinal.kit.PropKit"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>用户</title>
    <link href="/<%=PropKit.get("project_name") %>/html/admin_new/res/css/bootstrap.min14ed.css?v=3.3.6" rel="stylesheet">
    <link href="/<%=PropKit.get("project_name") %>/html/admin_new/res/css/font-awesome.min93e3.css?v=4.4.0" rel="stylesheet">
    <!-- Data Tables -->
    <link href="/<%=PropKit.get("project_name") %>/html/admin_new/res/css/plugins/dataTables/dataTables.bootstrap.css" rel="stylesheet">
    <link href="/<%=PropKit.get("project_name") %>/html/admin_new/res/css/animate.min.css" rel="stylesheet">
    <link href="/<%=PropKit.get("project_name") %>/html/admin_new/res/css/style.min862f.css?v=4.1.0" rel="stylesheet">
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
                                    <th>用户名</th>
                                    <th>姓名</th>
                                    <th>角色名称</th>
                                    <th>操作</th>
                                </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${userlist }" var="user">
                            <tr class="gradeX">
                                <td>${user.username }</td>
				                <td>${user.nickname }</td>
				                <td>${user.rolename }</td>
				                <td>
				                	<c:if test="${user.delflag eq '1' }">
				                	<button class="btn btn-primary btn-sm" type="button"><i class="fa fa-paste"></i> 编辑</button>
				                	<button type="button" class="btn btn-danger btn-sm"><i class="fa fa fa-warning"></i> 删除</button>
				                	</c:if>
				                </td>
                            </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="/<%=PropKit.get("project_name") %>/html/admin_new/res/js/jquery.min.js?v=2.1.4"></script>
    <script src="/<%=PropKit.get("project_name") %>/html/admin_new/res/js/bootstrap.min.js?v=3.3.6"></script>
    <script src="/<%=PropKit.get("project_name") %>/html/admin_new/res/js/plugins/jeditable/jquery.jeditable.js"></script>
    <script src="/<%=PropKit.get("project_name") %>/html/admin_new/res/js/plugins/dataTables/jquery.dataTables.js"></script>
    <script src="/<%=PropKit.get("project_name") %>/html/admin_new/res/js/plugins/dataTables/dataTables.bootstrap.js"></script>
    <script src="/<%=PropKit.get("project_name") %>/html/admin_new/res/js/content.min.js?v=1.0.0"></script>
	<script>
        $(document).ready(function(){
        	$("#list_table").dataTable();
        });
    </script>
</body>
</html>
