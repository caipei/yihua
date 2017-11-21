<%@ page import="com.jfinal.kit.PropKit"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
<div class="bjui-pageContent">
    <form action="/<%=PropKit.get("project_name") %>/admin/good/mallgood/update/" id="j_custom_form" data-toggle="validate" data-alertmsg="false">
		<table class="table table-condensed table-hover" width="100%">
        <tbody>
        <tr>
	        <td colspan="4">
	            <label class="control-label">商品信息</label>
	        </td>
	    </tr>
    	<tr>
	        <td>
	            <label for="goodname" class="control-label x85">商品名称：</label>
	            <input type="text" name="goodname" id="goodname" value="${goodname}" data-rule="商品名称:required;" size="15">
	        </td>
	     </tr>
	     <tr>
	        <td>
	            <label for="cost" class="control-label x85">商品价格：</label>
	            <input type="text" name="cost" id="cost" value="${cost}"  size="15">
	        </td>
	     </tr>
	     <tr>
	        <td>
	            <label for="caseurl" class="control-label x85">案例地址url：</label>
	            <input type="text" name="caseurl" id="caseurl" value="${caseurl}"  size="50">
	        </td>
	     </tr>
	     <tr>
	        <td>
	            <label for="goodcontent" class="control-label x85">商品介绍：</label>
	            <textarea name="goodcontent" cols=100 rows=10>
	            ${goodcontent}
	            </textarea>
	        </td>
	     </tr>
	     <tr >
				<td height="200px">
				<label class="control-label x85">商品图片：</label>
	            <div style="display: inline-block; vertical-align: middle;">
	                <div id="imgpath_up" data-toggle="upload" data-uploader="/<%=PropKit.get("project_name") %>/admin/upload/" 
	                    data-file-size-limit="1024000000"
	                    data-file-type-exts="*.jpg;*.png;"
	                    data-multi="true"
	                    data-auto="true"
	                    data-on-upload-success="pic_upload_success"
	                    data-icon="cloud-upload"></div>
	                <input type="hidden" name="imgpath" value="${imageurl}" id="imgpath">
	                <img src="${imageurl }" id="image" width="100px" height="100px"/>
	                <span id="imgpath_span" style="display:block; padding:5px 0;"></span>
	            </div>
				</td>
				</tr>
			<tr >
				<td height="200px">
				<label class="control-label x85">课程详情图片：</label>
	            <div style="display: inline-block; vertical-align: middle;">
	                <div id="imgpath_up" data-toggle="upload" data-uploader="/<%=PropKit.get("project_name") %>/admin/upload/" 
	                    data-file-size-limit="1024000000"
	                    data-file-type-exts="*.jpg;*.png;"
	                    data-multi="true"
	                    data-auto="true"
	                    data-on-upload-success="pic_upload_success1"
	                    data-icon="cloud-upload"></div>
	                <input type="hidden" name="imgpath1" value="${goodimage }" id="imgpath1">
	                <img src="${goodimage }" id="goodimage" width="100px" height="100px"/>
	                <span id="imgpath_span1" style="display:block; padding:5px 0;"></span>
	            </div>
				</td>
				</tr>
        </tbody>
    </table>
     <input id = "goodid" value="${goodid }" type ="hidden" name="goodid"/>
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
         var imgId2 = document.getElementById("image");
    	 imgId2.style.visibility ="hidden";
         $('#imgpath_span').html('<img src="'+ json.filename +'" width="100">')
     }
 }
function pic_upload_success1(file, data) {
    var json = $.parseJSON(data)
    $(this).bjuiajax('ajaxDone', json)
    if (json[BJUI.keys.statusCode] == BJUI.statusCode.ok) {
        $('#imgpath1').val(json.filename)
        var imgId2 = document.getElementById("goodimage");
    	 imgId2.style.visibility ="hidden";
        $('#imgpath_span1').html('<img src="'+ json.filename +'" width="100">')
    }
}
</script>