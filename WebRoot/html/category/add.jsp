<%@ page import="com.jfinal.kit.PropKit"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<div class="bjui-pageContent">
	<form
		action="/<%=PropKit.get("project_name")%>/admin/category/submit/"
		id="category_form" data-toggle="validate" data-alertmsg="false">
		<table class="table table-condensed table-hover" width="100%">
			<tbody>
				<tr>
					<td><label for="" class="control-label x85">类别名：</label> <input
						type="text" name="name" id="name" value="" data-rule="required;"
						size="15"> <label for="" class="control-label x85">状态：</label>
						<select name="rstate">
							<option value="1">启用</option>
							<option value="2">禁用</option>
					</select></td>
				</tr>
			</tbody>
		</table>
	</form>
</div>
<div class="bjui-pageFooter">
	<ul>
		<li><button type="button" class="btn-close" data-icon="close">取消</button></li>
		<li><button type="submit" class="btn-default" data-icon="save">保存</button></li>
	</ul>
</div>
