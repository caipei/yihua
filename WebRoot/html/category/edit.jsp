<%@ page import="com.jfinal.kit.PropKit"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<div class="bjui-pageContent">
	<form
		action="/<%=PropKit.get("project_name")%>/admin/category/update/"
		id="category_form" data-toggle="validate" data-alertmsg="false">
		<table class="table table-condensed table-hover" width="100%">
			<tbody>
				<tr>
					<td><label for="" class="control-label x85">类别名：</label> <input
						type="text" name="name" id="name" value="${name }"
						data-rule="required;" size="15"> <label for=""
						class="control-label x85">状态：</label> <select name="rstate">
							<option value="1" ${rstate==1?'selected':'' }>启用</option>
							<option value="2" ${rstate==2?'selected':'' }>禁用</option>
					</select></td>
				</tr>
			</tbody>
		</table>
		<input name="id" type="hidden" value="${categoryid }">
	</form>
</div>
<div class="bjui-pageFooter">
	<ul>
		<li><button type="button" class="btn-close" data-icon="close">取消</button></li>
		<li><button type="submit" class="btn-default" data-icon="save">保存</button></li>
	</ul>
</div>
