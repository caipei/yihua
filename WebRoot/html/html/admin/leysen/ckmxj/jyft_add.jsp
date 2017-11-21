<%@ page import="com.jfinal.kit.PropKit"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
<div class="bjui-pageContent">
<form action="/<%=PropKit.get("project_name") %>/admin/leysen/ckmxj/jyft_submit" id="leysen_ckmxj_jyft_addform" data-toggle="validate" data-alertmsg="false">
	<table class="table table-condensed table-hover" width="100%">
        <tbody>
        <tr>
	        <td style="display: flex; align-items: center;">
	            <label class="control-label x100">图片：</label>
	            <div style="display: inline-block; vertical-align: middle; flex: 1">
					<span id="leysen_ckmxj_jyft_add_img_upload_span" class="img_thumbnail_add_span">
						<img class="img_upload" id="leysen_ckmxj_jyft_add_img_upload" src="/<%=PropKit.get("project_name") %>/res/images/img_add.png">
					</span>
					<span id="leysen_ckmxj_jyft_add_img_imgs_div">
					</span>
					<input id="imgpath" name="imgpath" type="hidden" value="" />
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
        <li><button id="leysen_ckmxj_jyft_submit" type="button" class="btn-default" data-icon="save">保存</button></li>
    </ul>
</div>
<script type="text/javascript">
$(document).ready(function(){
	
	$.CurrentNavtab.find("#leysen_ckmxj_jyft_submit").click(function() {
		
		var imgpath = '';
		$.CurrentNavtab.find('#leysen_ckmxj_jyft_add_img_imgs_div img[name="img_thumbnail"]').each(function() {
			imgpath = $(this).attr('src');
		});
		$.CurrentNavtab.find('#imgpath').val(imgpath);
		
		$.CurrentNavtab.find("#leysen_ckmxj_jyft_addform").submit();
	});
	
	uploadimg('leysen_ckmxj_jyft_add_', 1);
});

</script>