<%@ page import="com.jfinal.kit.PropKit"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
<div class="bjui-pageHeader">
	<div id="drcs_btns" class="pull-right">
          <button id="drcs1" type="button" class="btn-blue" >微信抽奖阶段1城市</button>
          <button id="drcs2" type="button" class="btn-blue" >微信抽奖阶段3城市</button>
   	</div>
</div>
<script type="text/javascript">
$(document).ready(function(){
	var Qiniu1 = new QiniuJsSDK();
	var uploader1 = Qiniu1.uploader({
        runtimes: 'html5,flash,html4',
        browse_button: 'drcs1',
        container: 'drcs_btns',
        unique_names: true,
        flash_swf_url: '/<%=PropKit.get("project_name") %>/res/BJUI/lib/plupload/js/Moxie.swf',
        dragdrop: false,
        chunk_size: '4mb',
        uptoken_url: '/<%=PropKit.get("project_name") %>/admin/upload/uptoken',
        domain: "<%=PropKit.get("qiniu_prefix") %>",
        filters : {
            max_file_size : '10mb',
            mime_types: [
                {title : "Image files", extensions : "xlsx"}
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
                 // 调用接口下载excel进行解析
                 var params = {};
                 params.url = sourceLink;
                 params.tablename = 't_wxcj_jj_shop';
                 $.post("/<%=PropKit.get("project_name") %>/admin/city/city1_import", params , function (returnJson){
         			var statusCode = returnJson.statusCode;
         			if (statusCode == 200) {
         				
         			}
         		}, "json");
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
	
	var Qiniu2 = new QiniuJsSDK();
	var uploader1 = Qiniu1.uploader({
        runtimes: 'html5,flash,html4',
        browse_button: 'drcs2',
        container: 'drcs_btns',
        unique_names: true,
        flash_swf_url: '/<%=PropKit.get("project_name") %>/res/BJUI/lib/plupload/js/Moxie.swf',
        dragdrop: false,
        chunk_size: '4mb',
        uptoken_url: '/<%=PropKit.get("project_name") %>/admin/upload/uptoken',
        domain: "<%=PropKit.get("qiniu_prefix") %>",
        filters : {
            max_file_size : '10mb',
            mime_types: [
                {title : "Image files", extensions : "xlsx"}
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
                 // 调用接口下载excel进行解析
                 var params = {};
                 params.url = sourceLink;
                 params.tablename = 't_wxcj_jj3_shop';
                 $.post("/<%=PropKit.get("project_name") %>/admin/city/city1_import", params , function (returnJson){
         			var statusCode = returnJson.statusCode;
         			if (statusCode == 200) {
         				
         			}
         		}, "json");
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
});

</script>