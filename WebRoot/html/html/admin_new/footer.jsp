<%@ page import="com.jfinal.kit.PropKit"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
	<script src="/<%=PropKit.get("project_name") %>/html/admin_new/res/js/jquery.min.js?v=2.1.4"></script>
    <script src="/<%=PropKit.get("project_name") %>/html/admin_new/res/js/bootstrap.min.js?v=3.3.6"></script>
    <script src="/<%=PropKit.get("project_name") %>/html/admin_new/res/js/content.min.js?v=1.0.0"></script>
    <script src="/<%=PropKit.get("project_name") %>/html/admin_new/res/js/plugins/validate/jquery.validate.min.js"></script>
    <script src="/<%=PropKit.get("project_name") %>/html/admin_new/res/js/plugins/validate/messages_zh.min.js"></script>
    <script src="/<%=PropKit.get("project_name") %>/html/admin_new/res/js/demo/form-validate-demo.min.js"></script>
	<script src="/<%=PropKit.get("project_name") %>/html/admin_new/res/js/plugins/sweetalert/sweetalert.min.js"></script>
    <script src="/<%=PropKit.get("project_name") %>/html/admin_new/res/js/plugins/jeditable/jquery.jeditable.js"></script>
    <script src="/<%=PropKit.get("project_name") %>/html/admin_new/res/js/plugins/dataTables/jquery.dataTables.js"></script>
    <script src="/<%=PropKit.get("project_name") %>/html/admin_new/res/js/plugins/dataTables/dataTables.bootstrap.js"></script>
	<!--上传-->
	<script src="/<%=PropKit.get("project_name") %>/html/admin_new/res/js/plupload/js/plupload.full.min.js"></script>
	<script src="/<%=PropKit.get("project_name") %>/html/admin_new/res/js/qiniu/qiniu.min.js"></script>
	<script src="/<%=PropKit.get("project_name") %>/html/admin_new/res/js/plugins/fancybox/jquery.fancybox.js"></script>
	
	<script src="/<%=PropKit.get("project_name") %>/html/admin_new/res/js/plugins/datapicker/bootstrap-datepicker.js"></script>
	<script src="/<%=PropKit.get("project_name") %>/html/admin_new/res/js/plugins/layer/layer.min.js"></script>
	<script src="/<%=PropKit.get("project_name") %>/html/admin_new/res/js/wangeditor/wangEditor.min.js"></script>
	
	<script src="/<%=PropKit.get("project_name") %>/html/admin_new/res/js/plugins/iCheck/icheck.min.js"></script>
	
	<script type="text/javascript">
	$(document).ready(function(){
	});
	
	function uploadimg(id, type, event) {
		// type 为1时上传一张  2时上传多张
		var Qiniu = new QiniuJsSDK();
		var uploader = Qiniu.uploader({
	        runtimes: 'html5,flash,html4',
	        browse_button: id + 'img_upload',
	        container: id + 'img_upload_span',
	        unique_names: true,
	        flash_swf_url: '/<%=PropKit.get("project_name") %>/res/admin_new/res/js/plupload/js/Moxie.swf',
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
	                 var previewHtml = '<span class="img_thumbnail_span">\r\n';
	 					previewHtml += '<a class="abcfancybox" href="'+sourceLink+'"><img name="img_thumbnail" class="img_thumbnail" src="'+sourceLink+'"></a>\r\n';
	 					previewHtml += '<img name="img_thumbnail_del" class="img_thumbnail_del" src="/<%=PropKit.get("project_name") %>/res/images/close.png" />\r\n';
	 					previewHtml += '</span>\r\n';
	 					if (type == 1) {
	 						$("#" + id + "img_imgs_div").html(previewHtml);
	 					} else {
	 						$("#" + id + "img_imgs_div").append(previewHtml);
	 					}
	 					
	 					$("#" + id + "img_imgs_div img[name='img_thumbnail_del']").unbind('click');
	 					$("#" + id + "img_imgs_div img[name='img_thumbnail_del']").bind('click', function(a) {
	 						var $$ = $(this);
	 						swal({
	 					        title: "确认删除?",
	 					        showCancelButton: true,
	 					        confirmButtonColor: "#DD6B55",
	 					        confirmButtonText: "删除",
	 					        cancelButtonText: "取消",
	 					        closeOnConfirm: true
	 					    }, function () {
	 					    	$$.parent().remove();
	 					    });
	 					});
	 					
	 					$(".abcfancybox").fancybox({openEffect:"none",closeEffect:"none"});
	 					
	 					if (event != null) {
	 						event();
	 					}
	 					
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
		
		$("#" + id + "img_imgs_div img[name='img_thumbnail_del']").click(function() {
			var $$ = $(this);
			swal({
		        title: "确认删除?",
		        type: "warning",
		        showCancelButton: true,
		        confirmButtonColor: "#DD6B55",
		        confirmButtonText: "删除",
		        closeOnConfirm: false
		    }, function () {
		    	$$.parent().remove();
		    });
		});
		
		$("#" + id + "img_imgs_div img[name='img_thumbnail']").click(function() {
			var linkurl = $(this).attr("src");
			$(this).dialog({id:'dialog-img', url:'/<%=PropKit.get("project_name") %>/admin/upload/showimg?url=' + linkurl, title:'图片'});
		});
	}
	
	var datatablelang = {
            "sProcessing": "处理中...",
            "sLengthMenu": "每页 _MENU_ 项",
            "sZeroRecords": "没有匹配结果",
            "sInfo": "当前显示第 _START_ 至 _END_ 项，共 _TOTAL_ 项。",
            "sInfoEmpty": "当前显示第 0 至 0 项，共 0 项",
            "sInfoFiltered": "(由 _MAX_ 项结果过滤)",
            "sInfoPostFix": "",
            "sSearch": "搜索:",
            "sUrl": "",
            "sEmptyTable": "表中数据为空",
            "sLoadingRecords": "载入中...",
            "sInfoThousands": ",",
            "oPaginate": {
                "sFirst": "首页",
                "sPrevious": "上页",
                "sNext": "下页",
                "sLast": "末页",
                "sJump": "跳转"
            },
            "oAria": {
                "sSortAscending": ": 以升序排列此列",
                "sSortDescending": ": 以降序排列此列"
            }
        };
	
	var editorconfigmenus = ['head','bold','italic','underline','strikeThrough','foreColor','backColor','link','list','justify','quote','image','table','video','code','undo','redo'];
	
	function back() {
    	history.back();
    }
	
	</script>
