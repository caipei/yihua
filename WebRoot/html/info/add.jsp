<%@ page import="com.jfinal.kit.PropKit"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
<div class="bjui-pageContent">
    <form action="/<%=PropKit.get("project_name") %>/admin/info/submit/" id="j_custom_form" data-toggle="validate" data-alertmsg="false">
	<table class="table table-condensed table-hover" width="100%">
        <tbody>
    	<tr>
	        <td>
	            <label for="title" class="control-label x85">标题：</label>
	            <input type="text" name="title" id="title" value="" data-rule="标题:required;" size="60">
	        </td>
        </tr>
        <tr>
	        <td>
	            <label for="category_sel" class="control-label x85">类别：</label>
	            <select name="category_sel" id="category_sel" data-toggle="selectpicker">
	            	<c:forEach items="${categorylist}" var="category">
                    <option value="${category.id }">${category.name }</option>
                    </c:forEach>
                </select>
	        </td>
        </tr>
        <tr>
	        <td>
	            <label for="source" class="control-label x85">来源：</label>
	            <input type="text" name="source" id="source" value="" size="30">
	        </td>
        </tr>
        <tr>
	        <td>
	            <label for="author" class="control-label x85">作者：</label>
	            <input type="text" name="author" id="author" value="" size="30">
	        </td>
        </tr>
        <tr>
	        <td>
	            <label for="remark" class="control-label x85">简介：</label>
	            <textarea id="remark" name="remark" cols="60" rows="1" data-toggle="autoheight"></textarea>
	        </td>
        </tr>
        <tr>
	        <td>
	            <label class="control-label x85">缩略图：</label>
	            <div style="display: inline-block; vertical-align: middle;">
	                <div id="imgpath_up" data-toggle="upload" data-uploader="/<%=PropKit.get("project_name") %>/admin/upload/" 
	                    data-file-size-limit="1024000000"
	                    data-file-type-exts="*.jpg;*.png;"
	                    data-multi="true"
	                    data-auto="true"
	                    data-on-upload-success="pic_upload_success"
	                    data-icon="cloud-upload"></div>
	                <input type="hidden" name="imgpath" value="" id="imgpath">
	                <span id="imgpath_span" style="display:block; padding:5px 0;"></span>
	            </div>
	        </td>
        </tr>
        <tr>
            <td colspan="4">
                <label for="content" class="control-label x85">内容编辑：</label>
                <div style="display: inline-block; vertical-align: middle;">
                    <script id="content" name="content" type="text/plain"></script>
                </div>
            </td>
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
<script type="text/javascript">
$(document).ready(function(){
	var ue = UE.getEditor('content', {
		toolbars: [['bold', 'italic', 'underline', 'fontborder', 'strikethrough', 'superscript', 'subscript', 'removeformat', 'formatmatch', 'autotypeset', 'blockquote', 'pasteplain', '|', 'forecolor', 'backcolor', 'insertorderedlist', 'insertunorderedlist', 'selectall', 'cleardoc', '|',
	         'rowspacingtop', 'rowspacingbottom', 'lineheight', '|',
	         'customstyle', 'paragraph', 'fontfamily', 'fontsize', '|',
	         'directionalityltr', 'directionalityrtl', 'indent', '|',
	         'justifyleft', 'justifycenter', 'justifyright', 'justifyjustify', '|', 'touppercase', 'tolowercase', '|',
	         'link', 'unlink', 'anchor', '|', 'imagenone', 'imageleft', 'imageright', 'imagecenter', '|',
	         'simpleupload'
	     ]]
		,initialFrameWidth: 800
		,initialFrameHeight: 320
		,wordCount: false
		,autoHeightEnabled: false
		,elementPathEnabled: false
	});
	
	UE.Editor.prototype._bkGetActionUrl = UE.Editor.prototype.getActionUrl;
	UE.Editor.prototype.getActionUrl = function(action) {
	    if (action == 'uploadimage' || action == 'uploadscrawl' || action == 'uploadimage') {
	        return '/<%=PropKit.get("project_name") %>/admin/upload/uploadimg';
	    } else if (action == 'uploadvideo') {
	        return '/<%=PropKit.get("project_name") %>/admin/upload/uploadvideo';
	    } else {
	        return this._bkGetActionUrl.call(this, action);
	    }
	}
});

function pic_upload_success(file, data) {
     var json = $.parseJSON(data)
     $(this).bjuiajax('ajaxDone', json)
     if (json[BJUI.keys.statusCode] == BJUI.statusCode.ok) {
         $('#imgpath').val(json.filename)
         $('#imgpath_span').html('<img src="'+ json.filename +'" width="100">')
     }
 }
	
</script>