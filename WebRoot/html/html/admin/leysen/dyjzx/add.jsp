<%@ page import="com.jfinal.kit.PropKit"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
<div class="bjui-pageContent">
<form action="/<%=PropKit.get("project_name") %>/admin/leysen/dyjzx/submit" id="leysen_dyjzx_addform" data-toggle="validate" data-alertmsg="false">
	<table class="table table-condensed table-hover" width="100%">
        <tbody>
        <tr>
	        <td>
	            <label for="title" class="control-label x100">标题：</label>
	            <input type="text" name="title" id="title" value="" data-rule="标题:required;" placeholder="标题" size="80">
	        </td>
        </tr>
        <tr>
	        <td style="display: flex; align-items: center;">
	            <label class="control-label x100">图片：</label>
	            <div style="display: inline-block; vertical-align: middle; flex: 1; margin-left: 4px;">
					<span id="leysen_dyjzx_add_img_upload_span" class="img_thumbnail_add_span">
						<img class="img_upload" id="leysen_dyjzx_add_img_upload" src="/<%=PropKit.get("project_name") %>/res/images/img_add.png">
					</span>
					<span id="leysen_dyjzx_add_img_imgs_div">
					</span>
					<input id="imgpath" name="imgpath" type="hidden" value="" />
	            </div>
	        </td>
        </tr>
        <tr>
	        <td>
	            <label for="remark" class="control-label x100">简介：</label>
	            <textarea style="width: 800px" id="remark" data-rule="简介:required;" name="remark"></textarea>
	        </td>
        </tr>
        <tr>
	        <td>
	            <label class="control-label x100">详情：</label>
	            <div style="display: inline-block; vertical-align: middle;">
                    <textarea name="content" id="content" class="j-content" style="width: 800px;" data-toggle="kindeditor" data-minheight="200" data-items="fontname, fontsize, |, forecolor, hilitecolor, bold, italic, underline, removeformat, |, justifyleft, justifycenter, justifyright, insertorderedlist, insertunorderedlist, |, emoticons, image, link" data-uploadjson="/<%=PropKit.get("project_name") %>/admin/upload/upload"></textarea>
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
        <li><button id="leysen_dyjzx_submit" type="button" class="btn-default" data-icon="save">保存</button></li>
    </ul>
</div>
<script type="text/javascript">
$(document).ready(function(){
	
	$.CurrentNavtab.find("#leysen_dyjzx_submit").click(function() {
		
		var imgpath = '';
		$.CurrentNavtab.find('#leysen_dyjzx_add_img_imgs_div img[name="img_thumbnail"]').each(function() {
			imgpath = $(this).attr('src');
		});
		$.CurrentNavtab.find('#imgpath').val(imgpath);
		
		$.CurrentNavtab.find("#leysen_dyjzx_addform").submit();
	});
	
	uploadimg('leysen_dyjzx_add_', 1);
});

</script>