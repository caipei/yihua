<%@ page import="com.jfinal.kit.PropKit"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>主题列表</title>
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
					                <th>主题名称</th>
					                <th width="200">图片</th>
					                <th width="100">操作</th>
                                </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${infolist}" var="info">
					      	<tr class="gradeX">
				                <td>${info.name }</td>
				                <td><a class="abcfancybox" href="${info.imgpath }"><img src="${info.imgpath }" style="max-width:100px; max-height:100px;" /></a></td>
				                <td>
                                	<div class="btn-group">
	                                	<button data-toggle="dropdown" class="btn btn-primary btn-xs dropdown-toggle">操作 <span class="caret"></span></button>
	                                	<ul class="dropdown-menu">
	                                	<li><a onclick="edit(${info.id})" href="javascript:void();">编辑</a></li>
							            <li><a onclick="yulan(${info.type})" href="javascript:void();">预览</a></li>
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
    <jsp:include page="../footer.jsp"></jsp:include>
    <script type="text/javascript">
		$(document).ready(function(){
			$(".abcfancybox").fancybox({openEffect:"none",closeEffect:"none"});
		});
</script>
    
</body>
</html>
