<%@ page import="com.jfinal.kit.PropKit"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
<div class="bjui-pageContent">
    <form action="/<%=PropKit.get("project_name") %>/admin/role/authsubmit/" id="j_custom_form" data-toggle="validate" data-alertmsg="false">
	<table class="table table-condensed table-hover" width="100%">
        <tbody>
    	<tr>
	        <td>
	            <ul id="tree" class="ztree"></ul>
	        </td>
        </tr>
        </tbody>
    </table>
    <input type="hidden" id="roleid" name="roleid" value="${roleid }" />
    <input type="hidden" id="funcids" name="funcids" value="" />
    </form>
</div>
<div class="bjui-pageFooter">
    <ul>
        <li><button type="button" class="btn-close" data-icon="close">取消</button></li>
        <li><button id="save" type="button" class="btn-default" data-icon="save">保存</button></li>
    </ul>
</div>



<script type="text/javascript">
	$(document).ready(function(){
		
		$("#menu_role").attr("class","active");
		
		var setting = {
				check: {
					enable: true
				},
				data: {
					simpleData: {
						enable: true
					}
				}
			};
			
		var treeObj = null;
		
		$.post("/<%=PropKit.get("project_name") %>/admin/role/authtree", {roleid: $("#roleid").val()}, function(zNodes){
			treeObj = $.fn.zTree.init($("#tree"), setting, zNodes);
		}, "json");
		
		$("#save").click(function() {
			
			var nodes = treeObj.getCheckedNodes(true);
			var funcids = '|';
			$(nodes).each(function(){
				funcids += this.id + '|';
			});
			console.info(funcids);
			$("#funcids").val(funcids);
			$("#j_custom_form").submit();
		});
	});
	</script>
