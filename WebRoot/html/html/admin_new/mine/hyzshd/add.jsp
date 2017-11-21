<%@ page import="com.jfinal.kit.PropKit"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="../../meta.jsp"></jsp:include>    
	<title>会员专属活动-新增</title>
</head>

<body class="gray-bg">
    <div class="wrapper wrapper-content animated fadeInRight">
        <div class="row">
            <div class="col-sm-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-content">
                        <form class="form-horizontal m-t" id="hyzshd_form">
                            <div class="form-group">
                                <label class="col-sm-3 control-label">标题：</label>
                                <div class="col-sm-8">
                                    <input id="title" name="title" type="text" value="" class="form-control" required="" aria-required="true" aria-required="true">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">开始时间：</label>
                                <div class="col-sm-8">
                                    <input id="starttime" name="starttime" type="text" value="" class="form-control" required="" aria-required="true">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">结束时间：</label>
                                <div class="col-sm-8">
                                    <input id="endtime" name="endtime" type="text" value="" class="form-control" required="" aria-required="true">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">图片：</label>
                                <div class="col-sm-8">
                                    <div style="display: inline-block; vertical-align: middle;">
										<span id="hyzshd_add_img_upload_span" class="img_thumbnail_add_span">
											<img class="img_upload" id="hyzshd_add_img_upload" src="/<%=PropKit.get("project_name") %>/res/images/img_add.png">
										</span>
										<span id="hyzshd_add_img_imgs_div">
										</span>
						            </div>
                                </div>
                            </div>
                            
                            <div class="form-group">
                                <label class="col-sm-3 control-label">活动内容：</label>
                                <div class="col-sm-8">
                                	<div id="content"></div>
                                </div>
                            </div>
                            
                            <div class="form-group">
                                <div class="col-sm-4 col-sm-offset-3">
                                    <button onclick="tijiao();" class="btn btn-primary" type="button">提交</button>
                                    <button onclick="back();" class="btn btn-info" type="button">返回</button>
                                </div>
                            </div>
                            <input id="imgpath" name="imgpath" type="hidden" value="" />
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
	<jsp:include page="../../footer.jsp"></jsp:include>    
    
    <script type="text/javascript">
    
    var E = window.wangEditor;
    var editor;
    
    $(document).ready(function(){
    	
    	editor = new E('#content');
    	
        editor.customConfig.menus = editorconfigmenus;
        editor.customConfig.uploadImgShowBase64 = true;
        editor.customConfig.showLinkImg = false;
        editor.create()
    	
    	$('#starttime').datepicker({format: "yyyy-mm-dd",autoclose: true});
    	
    	$('#endtime').datepicker({format: "yyyy-mm-dd",autoclose: true});
    	
    	uploadimg('hyzshd_add_', 1);
    	
    });
    
    function tijiao() {
    	
    	var imgpath = '';
		$('#hyzshd_add_img_imgs_div img[name="img_thumbnail"]').each(function() {
			imgpath = $(this).attr('src');
		});
		$('#imgpath').val(imgpath);

		var params = {};
		params.title = $('#title').val();
		params.starttime = $('#starttime').val();
		params.endtime = $('#endtime').val();
		params.imgpath = $('#imgpath').val();
		params.content = editor.txt.html();
		$.post('/<%=PropKit.get("project_name") %>/admin_new/mine/hyzshd/submit/', params, function(returnJson) {
			var rescode = returnJson.rescode;
			var rescnt = returnJson.rescnt;
			if (rescode == '0000') {
				window.location.href = '/<%=PropKit.get("project_name") %>/admin_new/mine/hyzshd/';
			}
		});
    }
    
    function back() {
    	history.back();
    }
    </script>
</body>
</html>
