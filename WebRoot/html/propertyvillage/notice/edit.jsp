<%@ page import="com.jfinal.kit.PropKit"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
<div class="bjui-pageContent">
    <form action="/<%=PropKit.get("project_name") %>/admin/village/updatenotice/" id="j_custom_form" data-toggle="validate" data-alertmsg="false">
		<table class="table table-condensed table-hover" width="100%">
        <tbody>
        <tr>
	        <td colspan="4">
	            <label class="control-label">公告信息</label>
	        </td>
	    </tr>
    	<tr>
	        <td>
	            <label for="noticedetail" class="control-label x200">公告详情：</label>
	            <input type="text" name="noticedetail" id="noticedetail" value="${noticedetail }" data-rule="公告详情:required;" size="15">
	        </td>
	     </tr>
				
        </tbody>
    </table>
     <input id = "id" value="${id }" type ="hidden" name="id"/>
    </form>
</div>
<div class="bjui-pageFooter">
    <ul>
        <li><button type="button" class="btn-close" data-icon="close">取消</button></li>
        <li><button type="submit" class="btn-default" data-icon="save">保存</button></li>
    </ul>
</div>
<script type="text/javascript">
</script>