<%@ page import="com.jfinal.kit.PropKit"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
<div class="bjui-pageContent">
<form action="/<%=PropKit.get("project_name") %>/admin/brand/themeupdate/" id="brand_editform" data-toggle="validate" data-alertmsg="false">
	<table class="table table-condensed table-hover" width="100%">
        <tbody>
    	<tr>
	        <td>
	            <label for="name" class="control-label x100">名称：</label>
	            <input type="text" name="name" id="name" value="${name }" disabled="disabled" data-rule="名称:required;" placeholder="名称" size="64">
	        </td>
        </tr>
        <tr>
	        <td>
	            <label class="control-label x100">图片：</label>
	            <div style="display: inline-block; vertical-align: middle;">
					<span id="brand_edit_img_upload_span" class="img_thumbnail_add_span">
						<img class="img_upload" id="brand_edit_img_upload" src="/<%=PropKit.get("project_name") %>/res/images/img_add.png">
					</span>
					<span id="img_imgs_div">
					<c:if test="${!empty imgpath}">
					<span class="img_thumbnail_span">
					<img name="img_thumbnail" class="img_thumbnail" src="${imgpath}">
					<img name="img_thumbnail_del" class="img_thumbnail_del" src="/<%=PropKit.get("project_name") %>/res/images/close.png" />
					</span>
					</c:if>
					</span>
					<input id="imgpath" name="imgpath" type="hidden" value="${imgpath }" />
	            </div>
	        </td>
        </tr>
        <tr>
	        <td>
	            <label for="name" class="control-label x100">内容：</label>
	            <span>
	            <c:if test="${type eq 1 }">
	            <a href="/<%=PropKit.get("project_name") %>/admin/brand/ztxl?id=${id}" class= "btn btn-blue" data-toggle="navtab" data-id="brand_theme_ztxl" data-reload-warn="本页已有打开的内容，确定将刷新本页内容，是否继续？" data-title="查看列表">查看列表</a>
	            </c:if>
	            <c:if test="${type eq 2 }">
	            <a href="/<%=PropKit.get("project_name") %>/admin/brand/lshy?id=${id}" class= "btn btn-blue" data-toggle="navtab" data-id="brand_theme_lshy" data-reload-warn="本页已有打开的内容，确定将刷新本页内容，是否继续？" data-title="编辑内容">编辑内容</a>
	            </c:if>
	            <c:if test="${type eq 3 }">
	            <a href="/<%=PropKit.get("project_name") %>/admin/brand/gjdz?id=${id}" class= "btn btn-blue" data-toggle="navtab" data-id="brand_theme_gjdz" data-reload-warn="本页已有打开的内容，确定将刷新本页内容，是否继续？" data-title="编辑内容">编辑内容</a>
	            </c:if>
	            <c:if test="${type eq 4 }">
	            <a href="/<%=PropKit.get("project_name") %>/admin/brand/csfc?id=${id}" class= "btn btn-blue" data-toggle="navtab" data-id="brand_theme_csfc" data-reload-warn="本页已有打开的内容，确定将刷新本页内容，是否继续？" data-title="查看列表">查看列表</a>
	            </c:if>
	            </span>
	        </td>
        </tr>
        </tbody>
    </table>
    <input type="hidden" id="id" name="id" value="${id }" />
    </form>
</div>
<div class="bjui-pageFooter">
    <ul>
        <li><button type="button" class="btn-close" data-icon="close">取消</button></li>
        <li><button id="brand_themeupdate" type="button" class="btn-default" data-icon="save">保存</button></li>
    </ul>
</div>
<script type="text/javascript">
$(document).ready(function(){
	
	$.CurrentNavtab.find("#brand_themeupdate").click(function() {
		var imgpath = '';
		$.CurrentNavtab.find('#img_imgs_div img[name="img_thumbnail"]').each(function() {
			imgpath = $(this).attr('src');
		});
		$.CurrentNavtab.find('#imgpath').val(imgpath);
		
		$.CurrentNavtab.find("#brand_editform").submit();
	});
	
	var Qiniu1 = new QiniuJsSDK();
	var uploader1 = Qiniu1.uploader({
        runtimes: 'html5,flash,html4',
        browse_button: 'brand_edit_img_upload',
        container: 'brand_edit_img_upload_span',
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
                    // 文件添加进队列后,处理相关的事情
                });
            },
            'BeforeUpload': function(up, file) {
                   // 每个文件上传前,处理相关的事情
            },
            'UploadProgress': function(up, file) {
                   // 每个文件上传时,处理相关的事情
            },
            'FileUploaded': function(up, file, info) {
                   // 每个文件上传成功后,处理相关的事情
                   // 其中 info 是文件上传成功后，服务端返回的json，形式如
                   // {
                   //    "hash": "Fh8xVqod2MQ1mocfI4S4KpRL6D98",
                   //    "key": "gogopher.jpg"
                   //  }
                   // 参考http://developer.qiniu.com/docs/v6/api/overview/up/response/simple-response.html
                 var domain = up.getOption('domain');
                 var res = $.parseJSON(info);
                 var sourceLink = domain + res.key;// 获取上传成功后的文件的Url
                 var previewHtml = '<span class="img_thumbnail_span">\r\n';
 					previewHtml += '<img name="img_thumbnail" class="img_thumbnail" src="'+sourceLink+'">\r\n';
 					previewHtml += '<img name="img_thumbnail_del" class="img_thumbnail_del" src="/<%=PropKit.get("project_name") %>/res/images/close.png" />\r\n';
 					previewHtml += '</span>\r\n';
 					$.CurrentNavtab.find("#img_imgs_div").html(previewHtml);
 					
 					$.CurrentNavtab.find("#img_imgs_div img[name='img_thumbnail_del']").unbind('click');
 					$.CurrentNavtab.find("#img_imgs_div img[name='img_thumbnail_del']").bind('click', function(a) {
 						var $$ = $(this);
 						$(this).alertmsg('confirm', '确认删除', {okName:'确定', cancelName:'取消', okCall:function() {
 							$$.parent().remove();
 						}})
 					});
 					
 					$.CurrentNavtab.find("#img_imgs_div img[name='img_thumbnail']").unbind('click');
 					$.CurrentNavtab.find("#img_imgs_div img[name='img_thumbnail']").bind('click', function(a) {
 						var linkurl = $(this).attr("src");
 						$(this).dialog({id:'dialog-img', url:'/<%=PropKit.get("project_name") %>/admin/upload/showimg?url=' + linkurl, title:'图片'});
 					});
 					
 					$.CurrentNavtab.find("#img_path").val(sourceLink);
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
	
	$.CurrentNavtab.find("#img_imgs_div img[name='img_thumbnail_del']").click(function() {
		var $$ = $(this);
		$(this).alertmsg('confirm', '确认删除', {okName:'确定', cancelName:'取消', okCall:function() {
			$$.parent().remove();
		}})
	});
	
	$.CurrentNavtab.find("#img_imgs_div img[name='img_thumbnail']").click(function() {
		var linkurl = $(this).attr("src");
		$(this).dialog({id:'dialog-img', url:'/<%=PropKit.get("project_name") %>/admin/upload/showimg?url=' + linkurl, title:'图片'});
	});
	
	var Qiniu2 = new QiniuJsSDK();
	var uploader2 = Qiniu2.uploader({
        runtimes: 'html5,flash,html4',
        browse_button: 'brand_edit_imgs_upload',
        container: 'brand_edit_imgs_upload_span',
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
                    // 文件添加进队列后,处理相关的事情
                });
            },
            'BeforeUpload': function(up, file) {
                   // 每个文件上传前,处理相关的事情
            },
            'UploadProgress': function(up, file) {
                   // 每个文件上传时,处理相关的事情
            },
            'FileUploaded': function(up, file, info) {
                   // 每个文件上传成功后,处理相关的事情
                   // 其中 info 是文件上传成功后，服务端返回的json，形式如
                   // {
                   //    "hash": "Fh8xVqod2MQ1mocfI4S4KpRL6D98",
                   //    "key": "gogopher.jpg"
                   //  }
                   // 参考http://developer.qiniu.com/docs/v6/api/overview/up/response/simple-response.html
                 var domain = up.getOption('domain');
                 var res = $.parseJSON(info);
                 var sourceLink = domain + res.key;// 获取上传成功后的文件的Url
                 var previewHtml = '<span class="img_thumbnail_span">\r\n';
 					previewHtml += '<img name="img_thumbnail" class="img_thumbnail" src="'+sourceLink+'">\r\n';
 					previewHtml += '<img name="img_thumbnail_del" class="img_thumbnail_del" src="/<%=PropKit.get("project_name") %>/res/images/close.png" />\r\n';
 					previewHtml += '</span>\r\n';
 					$.CurrentNavtab.find("#imgs_imgs_div").append(previewHtml);
 					
 					$.CurrentNavtab.find("#imgs_imgs_div img[name='img_thumbnail_del']").unbind('click');
 					$.CurrentNavtab.find("#imgs_imgs_div img[name='img_thumbnail_del']").bind('click', function(a) {
 						var $$ = $(this);
 						$(this).alertmsg('confirm', '确认删除', {okName:'确定', cancelName:'取消', okCall:function() {
 							$$.parent().remove();
 						}})
 					});
 					
 					$.CurrentNavtab.find("#imgs_imgs_div img[name='img_thumbnail']").unbind('click');
 					$.CurrentNavtab.find("#imgs_imgs_div img[name='img_thumbnail']").bind('click', function(a) {
 						var linkurl = $(this).attr("src");
 						$(this).dialog({id:'dialog-img', url:'/<%=PropKit.get("project_name") %>/admin/upload/showimg?url=' + linkurl, title:'图片'});
 					});
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
	
	$.CurrentNavtab.find("#imgs_imgs_div img[name='img_thumbnail_del']").click(function() {
		var $$ = $(this);
		$(this).alertmsg('confirm', '确认删除', {okName:'确定', cancelName:'取消', okCall:function() {
			$$.parent().remove();
		}})
	});
	
	$.CurrentNavtab.find("#imgs_imgs_div img[name='img_thumbnail']").click(function() {
		var linkurl = $(this).attr("src");
		$(this).dialog({id:'dialog-img', url:'/<%=PropKit.get("project_name") %>/admin/upload/showimg?url=' + linkurl, title:'图片'});
	});
});

</script>