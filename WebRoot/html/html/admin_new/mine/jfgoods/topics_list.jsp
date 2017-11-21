<%@ page import="com.jfinal.kit.PropKit"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>类别列表</title>
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
					                <th>名称</th>
					                <th width="100">操作</th>
                                </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${topicslist}" var="topics">
                            	<tr>
					                <td>${topics.name}</td>
					                <td>
	                                	<div class="btn-group">
	                                	<button data-toggle="dropdown" class="btn btn-primary btn-xs dropdown-toggle">操作 <span class="caret"></span></button>
	                                	<ul class="dropdown-menu">
	                                	<li><a onclick="jfgoods_list(${topics.id})" href="javascript:;">积分商品列表</a></li>
	                                	</ul>
	                                	</div>
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
    <jsp:include page="../../footer.jsp"></jsp:include>
    <script type="text/javascript">
    	var datatable = null;
		$(document).ready(function(){
			
		});
		
		function jfgoods_list(topicsid) {
			
			window.location.href = '/<%=PropKit.get("project_name") %>/admin_new/mine/jfgoods/topics/jfgoods_list?topicsid=' + topicsid;
		}
	</script>
    
</body>
</html>
