<%@ page import="com.jfinal.kit.PropKit"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<script src="/<%=PropKit.get("project_name") %>/res/BJUI/js/jquery-1.9.1.min.js"></script>
<script src="/<%=PropKit.get("project_name") %>/res/BJUI/js/jquery.cookie.js"></script>
<script src="/<%=PropKit.get("project_name") %>/res/BJUI/js/Calendar.js"></script> 
	<div class="container kv-main">
		<!-- <div class="page-header">
            <h2>单张上传 <small></h2>
            </div> -->
		<form enctype="multipart/form-data" id="uploadForms" method="post">
			<input id="fileUpload" class="file" type="file" name="fileUpload"> <input type="button"
				onclick="importExcel();" value="导入">
		</form>
	</div>
<script type="text/javascript">
    function importExcel(){
    	var url = "/<%=PropKit.get("project_name")%>/admin/owner/importSubmit?villageid=${villageid}";
		$("#uploadForms").attr("action", url);
		$("#uploadForms").submit();
		window.close();
	}
</script>
