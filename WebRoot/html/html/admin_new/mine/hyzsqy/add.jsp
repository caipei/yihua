<%@ page import="com.jfinal.kit.PropKit"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="../../meta.jsp"></jsp:include>    
	<title>会员专属权益-新增</title>
</head>

<body class="gray-bg">
    <div class="wrapper wrapper-content animated fadeInRight">
        <div class="row">
            <div class="col-sm-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-content">
                        <form class="form-horizontal m-t" id="hyzsqy_form">
                            <div class="form-group">
                                <label class="col-sm-3 control-label">标题：</label>
                                <div class="col-sm-8">
                                    <input id="title" name="title" type="text" value="" class="form-control" required="" aria-required="true" aria-required="true">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">简介：</label>
                                <div class="col-sm-8">
                                	<textarea id="remark" name="remark" class="form-control" style="height:100px;"></textarea>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">图片：</label>
                                <div class="col-sm-8">
                                    <div style="display: inline-block; vertical-align: middle;">
										<span id="hyzsqy_add_img_upload_span" class="img_thumbnail_add_span">
											<img class="img_upload" id="hyzsqy_add_img_upload" src="/<%=PropKit.get("project_name") %>/res/images/img_add.png">
										</span>
										<span id="hyzsqy_add_img_imgs_div">
										</span>
										<input id="hyzsqy_add_imgpath" name="hyzsqy_add_imgpath" type="hidden" value="" />
						            </div>
                                </div>
                            </div>
                            
                            <div style="display: none" class="form-group">
                                <label class="col-sm-3 control-label">内容：</label>
                                <div class="col-sm-8">
                                    <textarea id="content" name="content" style="width:700px;height:200px;"></textarea> 
                                </div>
                            </div>
                            
                            <div class="form-group">
                                <div class="col-sm-4 col-sm-offset-3">
                                    <button id="submit" class="btn btn-primary" type="button">提交</button>
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
    $(document).ready(function(){
    	$('#submit').click(function() {
    		var imgpath = '';
    		$('#hyzsqy_add_img_imgs_div img[name="img_thumbnail"]').each(function() {
    			imgpath = $(this).attr('src');
    		});
    		$('#imgpath').val(imgpath);

    		$.post('/<%=PropKit.get("project_name") %>/admin_new/mine/hyzsqy/submit/', $('#hyzsqy_form').serialize(), function(returnJson) {
    			var rescode = returnJson.rescode;
    			var rescnt = returnJson.rescnt;
    			if (rescode == '0000') {
    				window.location.href = '/<%=PropKit.get("project_name") %>/admin_new/mine/hyzsqy/';
    			}
    		});
    		
    	});
    	
    	var items = ['source', 'clearhtml', '|', 'fontname', 'fontsize', '|', 'bold', 'italic', 'underline','removeformat', '|', 'justifyleft', 'justifycenter', 'justifyright', 'insertorderedlist','insertunorderedlist', '|', 'link', 'image', 'table'];
    	
    	var editor;
    	
    	KindEditor.ready(function(K) {  
            editor = K.create('#content', {
            	items : items,
            	afterBlur : function(){
                	this.sync();
            	}
            });
            
            KindEditor.plugin('image', function(K) {
            	uploadJson = K.undef(self.uploadJson, '/tongl/admin/upload/upload')
            });
     	});
    	
    	$('#starttime').datepicker({format: "yyyy-mm-dd",autoclose: true});
    	
    	$('#endtime').datepicker({format: "yyyy-mm-dd",autoclose: true});
    	
    	uploadimg('hyzsqy_add_', 1);
    	
    });
    
    function back() {
    	history.back();
    }
    </script>
</body>
</html>
