<%@ page import="com.jfinal.kit.PropKit"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<div class="bjui-pageContent">
	<form action="/<%=PropKit.get("project_name")%>/admin/memberpro/submit"
		id="j_custom_form" data-toggle="validate" data-alertmsg="false">
		<table class="table table-condensed table-hover" width="100%">
			<tbody>
				<tr>
					<td colspan="4"><label class="control-label">客户信息</label></td>
				</tr>
				<tr>
					<td><label for="username" class="control-label x85">客户姓名：</label>
						${username }</td>
					<td><label for="mobile" class="control-label x85">联系方式：</label>
						${mobile }</td>
				</tr>
				<tr>
					<td><label for="sex" class="control-label x85">性别：</label> <c:if
							test="${sex == 1 }">
	            	男
	            </c:if> <c:if test="${sex != 1 }">
	                                                         女
	            </c:if></td>
					<td><label for="address" class="control-label x85">住址：</label>
						${address }</td>
				</tr>
				<tr>
					<td><label for="housearea" class="control-label x85">住房面积：</label>
						${housearea }</td>
					<td><label for="villagename" class="control-label x85">所在小区：</label>
						${villagename }</td>
				</tr>
				<tr>
					<td><label for="building" class="control-label x85">小区栋数：</label>
						${building }</td>
					<td><label for="unit" class="control-label x85">单元楼：</label>
						${unit }</td>
				</tr>
				<tr>
					<td><label for="floor" class="control-label x85">楼层数：</label>
						${floor }</td>
					<td><label for="number" class="control-label x85">门牌号：</label>
						${number }</td>
				</tr>
				<tr>
					<td><label for="watercompany" class="control-label x85">水力公司：</label>
						${watercompany }</td>
					<td><label for="waterno" class="control-label x85">水卡号：</label>
						${waterno }</td>
				</tr>
				<tr>
					<td><label for="powercompany" class="control-label x85">电力公司：</label>
						${powercompany }</td>
					<td><label for="powerno" class="control-label x85">电卡号：</label>
						${powerno }</td>
				</tr>
				<tr>
					<td><label for="gascompany" class="control-label x85">煤气公司：</label>
						${gascompany }</td>
					<td><label for="gasno" class="control-label x85">煤气卡号：</label>
						${gasno }</td>
				</tr>
				<tr>

					<td><label for="waterneed" class="control-label x85">水费是否需要缴纳：</label>
						<select name="waterneed_sel" id="waterneed_sel"
						data-toggle="selectpicker"">
							<option value="1">是</option>
							<option value="2">否</option>
					</select></td>
					<td></td>
				</tr>
				<tr id="waterfee" style="display: none">
					<td><label for="waterrate" class="control-label x85">水费欠费：</label>
						<input type="text" name="waterrate" id="waterrate"
						value="${waterrate }" size="25" onkeyup="Num(this)"></td>
					<td></td>
				</tr>
				<tr>

					<td><label for="powerneed" class="control-label x85">电费是否需要缴纳：</label>
						<select name="powerneed_sel" id="powerneed_sel"
						data-toggle="selectpicker">
							<option value="1">是</option>
							<option value="2">否</option>
					</select></td>
					<td></td>
				</tr>
				<tr id="powerfee" style="display: none">
					<td><label for="powerrate" class="control-label x85">电费欠费：</label>
						<input type="text" name="powerrate" id="powerrate"
						value="${powerrate }" size="25" onkeyup="Num(this)"></td>
					<td></td>
				</tr>
				<tr>

					<td><label for="gasneed" class="control-label x85">煤气费是否需要缴纳：</label>
						<select name="gasneed_sel" id="gasneed_sel"
						data-toggle="selectpicker">
							<option value="1">是</option>
							<option value="2">否</option>
					</select></td>
					<td></td>
				</tr>
				<tr id="gasfee" style="display: none">
					<td><label for="gasrates" class="control-label x85">煤气费欠费：</label>
						<input type="text" name="gasrates" id="gasrates"
						value="${gasrates }" size="25" onkeyup="Num(this)"></td>
					<td></td>
				</tr>
				<tr>
					<td><label for="profeeneed" class="control-label x85">物业费是否需要缴纳：</label>
						<select name="profeeneed_sel" id="profeeneed_sel"
						data-toggle="selectpicker">
							<option value="1">是</option>
							<option value="2">否</option>
					</select></td>
					<td></td>
				</tr>
				<tr>
					<td id="feestart" style="display: none"><label
						for="profeestarttime" class="control-label x85">物业费开始时间(请以yyyy-MM-dd形式填写)：</label>
						<input type="text" name="profeestarttime" id="profeestarttime"
						value="${profeestarttime }" size="25"></td>
					<td></td>
				</tr>
			</tbody>
		</table>
		<input id="id" value="${id }" type="hidden" name="id" /> <input
			id="profeeneed" value="${profeeneed }" type="hidden"
			name="profeeneed" /> <input id="gasneed" value="${gasneed }"
			type="hidden" name="gasneed" /> <input id="powerneed"
			value="${powerneed }" type="hidden" name="powerneed" /> <input
			id="waterneed" value="${waterneed }" type="hidden" name="waterneed" />
	</form>
</div>
<div class="bjui-pageFooter">
	<ul>
		<li><button type="button" class="btn-close" data-icon="close">取消</button></li>
		<li><button type="submit" class="btn-default" data-icon="save">保存</button></li>
	</ul>
</div>
<script type="text/javascript">
	function Num(obj) {
		obj.value = obj.value.replace(/[^\d.]/g, ""); //清除"数字"和"."以外的字符
		obj.value = obj.value.replace(/^\./g, ""); //验证第一个字符是数字而不是
		obj.value = obj.value.replace(/\.{2,}/g, "."); //只保留第一个. 清除多余的
		obj.value = obj.value.replace(".", "$#$").replace(/\./g, "").replace(
				"$#$", ".");
		obj.value = obj.value.replace(/^(\-)*(\d+)\.(\d\d).*$/, '$1$2.$3'); //只能输入两个小数
	}
	$(document).ready(
			function() {
				$(
						"#profeeneed_sel option[value="
								+ $("#profeeneed").val() + "]").attr(
						"selected", true);
				$("#gasneed_sel option[value=" + $("#gasneed").val() + "]")
						.attr("selected", true);
				$("#powerneed_sel option[value=" + $("#powerneed").val() + "]")
						.attr("selected", true);
				$("#waterneed_sel option[value=" + $("#waterneed").val() + "]")
						.attr("selected", true);

				if ($("#profeeneed").val() == 1) {
					$("#feestart").show();
				} else {
					$("#feestart").hide();
				}
				if ($("#gasneed").val() == 1) {
					$("#gasfee").show();
				} else {
					$("#gasfee").hide();
				}
				if ($("#powerneed").val() == 1) {
					$("#powerfee").show();
				} else {
					$("#powerfee").hide();
				}
				if ($("#waterneed").val() == 1) {
					$("#waterfee").show();
				} else {
					$("#waterfee").hide();
				}
			});
	$(document).ready(function() {
		$("#profeeneed_sel").change(function() {
			var p1 = $(this).children('option:selected').val();//这就是selected的值 
			if (p1 == 1) {
				$("#feestart").show();
			} else {
				$("#feestart").hide();
			}
		});
		$("#gasneed_sel").change(function() {
			var p1 = $(this).children('option:selected').val();//这就是selected的值 
			if (p1 == 1) {
				$("#gasfee").show();
			} else {
				$("#gasfee").hide();
			}

		});
		$("#powerneed_sel").change(function() {
			var p1 = $(this).children('option:selected').val();//这就是selected的值 
			if (p1 == 1) {
				$("#powerfee").show();
			} else {
				$("#powerfee").hide();
			}

		});
		$("#waterneed_sel").change(function() {
			var p1 = $(this).children('option:selected').val();//这就是selected的值 
			if (p1 == 1) {
				$("#waterfee").show();
			} else {
				$("#waterfee").hide();
			}
		});
	});
</script>
