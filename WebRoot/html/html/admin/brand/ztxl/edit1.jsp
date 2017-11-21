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
	            <label class="control-label x100">图片：</label>
	            <div style="display: inline-block; vertical-align: middle; flex: 1">
					<span id="brand_ztxl_edit_img_upload_span" class="img_thumbnail_add_span">
						<img class="img_upload" id="brand_ztxl_edit_img_upload" src="/<%=PropKit.get("project_name") %>/res/images/img_add.png">
					</span>
					<span id="brand_ztxl_edit_img_imgs_div">
						<c:forEach items="${imgs }" var="img">
						<span class="img_thumbnail_span">
						<img name="img_thumbnail" class="img_thumbnail" src="${img.linkurl}">
						<img id="${img.md5id }_del" name="img_thumbnail_del" class="img_thumbnail_del" src="/<%=PropKit.get("project_name") %>/res/images/close.png" />
						</span>
						</c:forEach>
					</span>
	            </div>
	        </td>
        </tr>
        <tr>
	        <td style="display: flex; align-items: center; padding: 5px 0;">
	            <label for="title" class="control-label x100">对应产品：</label>
	            <span id="product_span" id="display:inline_block; margin: 10px 0">
	            	<c:forEach items="${products}" var="product">
	            		<span id="${product.md5id}_product_span" style="display: block; margin-bottom: 5px;">
 					 	<a href="/<%=PropKit.get("project_name") %>/admin/brand/product_choice_dialog?controlname=product_you_'+md5id+'" class= "btn btn-blue" data-toggle="dialog" data-width="600" data-height="400" data-id="dialog_choice_obj" data-mask="true">选择对象</a>
 					 	<span id="product_you_${product.md5id}_dialog_span">
 					 		<a href="/<%=PropKit.get("project_name") %>/brand/product?id=${product.id}" class= "btn btn-green" target="_blank">${product.name }</a>
 					 	</span>
 					 	<input value="${product.id }" id="product_you_${product.md5id }_dialog_id" name="product_you_dialog_id" type="hidden">
 					 	</span>
	            	</c:forEach>
	            </span>
	        </td>
        </tr>
        </tbody>
    </table>
    <input id="productids" name="productids" value="" type="hidden" />
    <input id="type" name="type" value="1" type="hidden" />
    <input id="imgs" name="imgs" type="hidden" value="" />
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
		
		var imgs = '';
		$.CurrentNavtab.find('#brand_ztxl_edit_img_imgs_div img[name="img_thumbnail"]').each(function() {
			imgs += $(this).attr('src') + '|';
		});
		$.CurrentNavtab.find('#imgs').val(imgs);
		
		var productids = '';
		$.CurrentNavtab.find('#product_span input[name="product_you_dialog_id"]').each(function() {
			productids += $(this).val() + '|';
		});
		$.CurrentNavtab.find('#productids').val(productids);
		
		$.CurrentNavtab.find("#brand_ztxl_addform").submit();
	});
	
	// type 为1时上传一张  2时上传多张
	var Qiniu = new QiniuJsSDK();
	var uploader = Qiniu.uploader({
        runtimes: 'html5,flash,html4',
        browse_button: 'brand_ztxl_edit_img_upload',
        container: 'brand_ztxl_edit_img_upload_span',
        unique_names: true,
        flash_swf_url: '/<%=PropKit.get("project_name") %>/res/BJUI/lib/plupload/js/Moxie.swf',
        dragdrop: false,
        chunk_size: '4mb',
        uptoken_url: '/<%=PropKit.get("project_name") %>/admin/upload/uptoken',
        domain: "<%=PropKit.get("qiniu_prefix") %>",
        filters : {
            max_file_size : '10mb',
            mime_types: [
                {title : "Image files", extensions : "jpeg,jpg,png"}
            ]
        },
        get_new_uptoken: true,
        auto_start: true,
        init: {
        	'FilesAdded': function(up, files) {
                plupload.each(files, function(file) {
                });
            },
            'BeforeUpload': function(up, file) {
            },
            'UploadProgress': function(up, file) {
            },
            'FileUploaded': function(up, file, info) {
                 var domain = up.getOption('domain');
                 var res = $.parseJSON(info);
                 var sourceLink = domain + res.key;// 获取上传成功后的文件的Url
                 var md5id = $.md5(sourceLink)
                 var previewHtml = '<span class="img_thumbnail_span">\r\n';
 					previewHtml += '<img name="img_thumbnail" class="img_thumbnail" src="'+sourceLink+'">\r\n';
 					previewHtml += '<img id="'+md5id+'_del" name="img_thumbnail_del" class="img_thumbnail_del" src="/<%=PropKit.get("project_name") %>/res/images/close.png" />\r\n';
 					previewHtml += '</span>\r\n';
 					$.CurrentNavtab.find("#brand_ztxl_edit_img_imgs_div").append(previewHtml);
 					
 					$.CurrentNavtab.find("#brand_ztxl_edit_img_imgs_div img[name='img_thumbnail_del']").unbind('click');
 					$.CurrentNavtab.find("#brand_ztxl_edit_img_imgs_div img[name='img_thumbnail_del']").bind('click', function(a) {
 						var $$ = $(this);
 						var id = $$.attr('id');
 						console.info(id)
 						var spanid = id.replace('_del','_product_span');
 						console.info(spanid)
 						$(this).alertmsg('confirm', '确认删除', {okName:'确定', cancelName:'取消', okCall:function() {
 							$$.parent().remove();
 							$('#' + spanid).remove();
 						}})
 					});
 					
 					$.CurrentNavtab.find("#brand_ztxl_edit_img_imgs_div img[name='img_thumbnail']").unbind('click');
 					$.CurrentNavtab.find("#brand_ztxl_edit_img_imgs_div img[name='img_thumbnail']").bind('click', function(a) {
 						var linkurl = $(this).attr("src");
 						$(this).dialog({id:'dialog-img', url:'/<%=PropKit.get("project_name") %>/admin/upload/showimg?url=' + linkurl, title:'图片'});
 					});
 					
 					var content = '';
 					 content += '<span id="'+md5id+'_product_span" style="display: block; margin-bottom: 5px;">\n';
 					 content += '<a href="/<%=PropKit.get("project_name") %>/admin/brand/product_choice_dialog?controlname=product_you_'+md5id+'" class= "btn btn-blue" data-toggle="dialog" data-width="600" data-height="400" data-id="dialog_choice_obj" data-mask="true">选择对象</a>\n';
 					 content += '<span id="product_you_'+md5id+'_dialog_span"></span>\n';
 					 content += '<input id="product_you_'+md5id+'_dialog_id" name="product_you_dialog_id" type="hidden">\n';
 					 content += '</span>\n';
 					$('#product_span').append(content);
            },
            'Error': function(up, err, errTip) {
                   //上传出错时,处理相关的事情
            },
            'UploadComplete': function() {
                   //队列文件处理完毕后,处理相关的事情
            },
            'Key': function(up, file) {
                // 若想在前端对每个文件的key进行个性化处理，可以配置该函数
                // 该配置必须要在 unique_names: false , save_key: false 时才生效
            }
        }
    });
	
	$.CurrentNavtab.find("#brand_ztxl_edit_img_imgs_div img[name='img_thumbnail_del']").click(function() {
		var $$ = $(this);
		var id = $$.attr('id');
		var spanid = id.replace('_del','_product_span');
		console.info(id);
		console.info(spanid);
		$(this).alertmsg('confirm', '确认删除', {okName:'确定', cancelName:'取消', okCall:function() {
			$$.parent().remove();
			$('#' + spanid).remove();
		}})
	});
	
	$.CurrentNavtab.find("#brand_ztxl_edit_img_imgs_div img[name='img_thumbnail']").click(function() {
		var linkurl = $(this).attr("src");
		$(this).dialog({id:'dialog-img', url:'/<%=PropKit.get("project_name") %>/admin/upload/showimg?url=' + linkurl, title:'图片'});
	});
});

</script>