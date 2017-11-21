<%@ page import="com.jfinal.kit.PropKit"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
<div class="bjui-pageContent">
<form action="/<%=PropKit.get("project_name") %>/admin/brand/ztxl_submit/" id="brand_ztxl_addform" data-toggle="validate" data-alertmsg="false">
	<table class="table table-condensed table-hover" width="100%">
        <tbody>
        <tr>
	        <td style="display: flex; align-items: center;">
	            <label class="control-label x100">图片：</label>
	            <div style="display: inline-block; vertical-align: middle; flex: 1">
					<span id="brand_ztxl_add_img_upload_span" class="img_thumbnail_add_span">
						<img class="img_upload" id="brand_ztxl_add_img_upload" src="/<%=PropKit.get("project_name") %>/res/images/img_add.png">
					</span>
					<span id="brand_ztxl_add_img_imgs_div">
					</span>
					<input id="imgpath" name="imgpath" type="hidden" value="" />
	            </div>
	        </td>
        </tr>
        <tr>
	        <td>
	            <label for="title" class="control-label x100">选择对应产品：</label>
	            <a href="/<%=PropKit.get("project_name") %>/admin/brand/product_choice_dialog?controlname=product1" class= "btn btn-blue" data-toggle="dialog" data-width="600" data-height="400" data-id="dialog_choice_obj" data-mask="true">选择对象</a>
	            <span id="product1_dialog_span"></span>
	            <input id="product1_dialog_id" name="product1_dialog_id" type="hidden">
	        </td>
        </tr>
        </tbody>
    </table>
    <input id="productids" name="productids" value="" type="hidden" />
    <input id="imgs" name="imgs" value="" type="hidden" />
    <input id="type" name="type" value="2" type="hidden" />
    </form>
</div>
<div class="bjui-pageFooter">
    <ul>
        <li><button type="button" class="btn-close" data-icon="close">取消</button></li>
        <li><button id="brand_ztxl_update" type="button" class="btn-default" data-icon="save">保存</button></li>
    </ul>
</div>
<script type="text/javascript">
$(document).ready(function(){
	
	$.CurrentNavtab.find("#brand_ztxl_update").click(function() {
		
		$('#productids').val($('#product1_dialog_id').val());
		
		var imgpath = '';
		$.CurrentNavtab.find('#brand_ztxl_add_img_imgs_div img[name="img_thumbnail"]').each(function() {
			imgpath = $(this).attr('src');
		});
		$.CurrentNavtab.find('#imgs').val(imgpath);
		
		$.CurrentNavtab.find("#brand_ztxl_addform").submit();
	});
	
	uploadimg('brand_ztxl_add_', 1);
});

</script>