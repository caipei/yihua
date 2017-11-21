<%@ page import="com.jfinal.kit.PropKit"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
	<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="/<%=PropKit.get("project_name") %>/html/admin_new/res/css/bootstrap.min14ed.css?v=3.3.6" rel="stylesheet">
    <link href="/<%=PropKit.get("project_name") %>/html/admin_new/res/css/font-awesome.min93e3.css?v=4.4.0" rel="stylesheet">
    <link href="/<%=PropKit.get("project_name") %>/html/admin_new/res/css/plugins/dataTables/dataTables.bootstrap.css" rel="stylesheet">
    <link href="/<%=PropKit.get("project_name") %>/html/admin_new/res/css/animate.min.css" rel="stylesheet">
    <link href="/<%=PropKit.get("project_name") %>/html/admin_new/res/css/style.min862f.css?v=4.1.0" rel="stylesheet">
	<link href="/<%=PropKit.get("project_name") %>/html/admin_new/res/css/plugins/sweetalert/sweetalert.css" rel="stylesheet">
	<link href="/<%=PropKit.get("project_name") %>/html/admin_new/res/js/plugins/fancybox/jquery.fancybox.css" rel="stylesheet">
	<link href="/<%=PropKit.get("project_name") %>/html/admin_new/res/css/plugins/datapicker/datepicker3.css" rel="stylesheet">
	<link href="/<%=PropKit.get("project_name") %>/html/admin_new/res/css/plugins/iCheck/custom.css" rel="stylesheet">
	<style type="text/css">
	.img_add { width: 100px; height: 100px; cursor: pointer; }
	.img_show { width: 100px; height: 100px; }
	.img_thumbnail_span {
		position:relative;
		display: inline-block;
		float: left;
		width: 104px;
		height: 104px;
		margin-right: 10px;
		margin-bottom: 5px;
		padding: 1px;
		text-align: center;
		border: 1px solid #ddd;
	}
	
	.img_thumbnail {
		max-width: 100px;
		max-height: 100px;
		cursor: pointer;
	}
	
	.img_thumbnail_del {
		position: absolute;
		height:30px;
		width:30px;
		cursor:pointer;
		left: 85px;
		top: -10px;
	}
	
	.img_thumbnail_add_span {
		display: inline-block;
		float: left;
		width: 104px;
		height: 104px;
		margin-right: 10px;
		margin-bottom: 5px;
		padding: 1px;
	}
	
	.img_thumbnail_add_span img {
		max-width: 104px;
		max-height: 104px;
		cursor: pointer;
	}
</style>
