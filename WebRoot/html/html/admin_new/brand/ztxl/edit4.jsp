<%@ page import="com.jfinal.kit.PropKit"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
<div class="bjui-pageContent">
<form action="/<%=PropKit.get("project_name") %>/admin/brand/ztxl_update/" id="brand_ztxl_addform" data-toggle="validate" data-alertmsg="false">
	<table class="table table-condensed table-hover" width="100%">
        <tbody>
        <tr>
	        <td style="display: flex; align-items: center;">
	            <label class="control-label x100">左图：</label>
	            <div style="display: inline-block; vertical-align: middle; flex: 1">
					<span id="brand_ztxl_edit_zuo_img_upload_span" class="img_thumbnail_add_span">
						<img class="img_upload" id="brand_ztxl_edit_zuo_img_upload" src="/<%=PropKit.get("project_name") %>/res/images/img_add.png">
					</span>
					<span id="brand_ztxl_edit_zuo_img_imgs_div">
						<c:if test="${!empty imgs1}">
						<span class="img_thumbnail_span">
						<img name="img_thumbnail" class="img_thumbnail" src="${imgs1}">
						<img name="img_thumbnail_del" class="img_thumbnail_del" src="/<%=PropKit.get("project_name") %>/res/images/close.png" />
						</span>
						</c:if>
					</span>
					<input id="brand_ztxl_edit_zuo_imgpath" name="brand_ztxl_edit_zuo_imgpath" type="hidden" value="" />
	            </div>
	        </td>
        </tr>
        <tr>
	        <td>
	            <label for="title" class="control-label x100">左图对应产品：</label>
	            <a href="/<%=PropKit.get("project_name") %>/admin/brand/product_choice_dialog?controlname=product_zuo" class= "btn btn-blue" data-toggle="dialog" data-width="600" data-height="400" data-id="dialog_choice_obj" data-mask="true">选择对象</a>
	            <span id="product_zuo_dialog_span">
	            	<a href="/<%=PropKit.get("project_name") %>/brand/product?id=${productsid1 }" class= "btn btn-green" target="_blank">${productsname1 }</a>
	            </span>
	            <input id="product_zuo_dialog_id" name="product_zuo_dialog_id" type="hidden" value="${productsid1 }">
	        </td>
        </tr>
        
        <tr>
	        <td style="display: flex; align-items: center;">
	            <label class="control-label x100">右图：</label>
	            <div style="display: inline-block; vertical-align: middle; flex: 1">
					<span id="brand_ztxl_edit_you_img_upload_span" class="img_thumbnail_add_span">
						<img class="img_upload" id="brand_ztxl_edit_you_img_upload" src="/<%=PropKit.get("project_name") %>/res/images/img_add.png">
					</span>
					<span id="brand_ztxl_edit_you_img_imgs_div">
						<c:if test="${!empty imgs2}">
						<span class="img_thumbnail_span">
						<img name="img_thumbnail" class="img_thumbnail" src="${imgs2}">
						<img name="img_thumbnail_del" class="img_thumbnail_del" src="/<%=PropKit.get("project_name") %>/res/images/close.png" />
						</span>
						</c:if> 
					</span>
	            </div>
	        </td>
        </tr>
        <tr>
	        <td>
	            <label for="title" class="control-label x100">右图对应产品：</label>
	            <a href="/<%=PropKit.get("project_name") %>/admin/brand/product_choice_dialog?controlname=product_you" class= "btn btn-blue" data-toggle="dialog" data-width="600" data-height="400" data-id="dialog_choice_obj" data-mask="true">选择对象</a>
	            <span id="product_you_dialog_span">
	            	<a href="/<%=PropKit.get("project_name") %>/brand/product?id=${productsid2 }" class= "btn btn-green" target="_blank">${productsname2 }</a>
	            </span>
	            <input id="product_you_dialog_id" name="product_you_dialog_id" type="hidden" value="${productsid2 }">
	        </td>
        </tr>
        </tbody>
    </table>
    <input id="productids" name="productids" value="${productids }" type="hidden" />
    <input id="imgs" name="imgs" value="${imgs }" type="hidden" />
    <input id="type" name="type" value="3" type="hidden" />
    <input id="id" name="id" value="${id }" type="hidden" />
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
		
		$.CurrentNavtab.find('#productids').val($('#product_zuo_dialog_id').val() + '|' + $('#product_you_dialog_id').val());
		
		var imgpath = '';
		$.CurrentNavtab.find('#brand_ztxl_edit_zuo_img_imgs_div img[name="img_thumbnail"]').each(function() {
			imgpath = $(this).attr('src');
		});
		
		var imgpath1 = '';
		$.CurrentNavtab.find('#brand_ztxl_edit_you_img_imgs_div img[name="img_thumbnail"]').each(function() {
			imgpath1 = $(this).attr('src');
		});
		
		$.CurrentNavtab.find('#imgs').val(imgpath + '|' + imgpath1);
		
		$.CurrentNavtab.find("#brand_ztxl_addform").submit();
	});
	
	uploadimg('brand_ztxl_edit_zuo_', 1);
	
	uploadimg('brand_ztxl_edit_you_', 1);
 });

</script>