<%@ page import="com.jfinal.kit.PropKit"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="../../meta.jsp"></jsp:include>    
	<title>产品-新增</title>
</head>

<body class="gray-bg">
    <div class="wrapper wrapper-content animated fadeInRight">
        <div class="row">
            <div class="col-sm-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-content">
                        <form class="form-horizontal m-t" id="product_form">
                            <div class="form-group">
                                <label class="col-sm-3 control-label">名称：</label>
                                <div class="col-sm-8">
                                    <input id="name" name="name" type="text" value="${name }" class="form-control" required="" aria-required="true">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">背景图片：</label>
                                <div class="col-sm-8">
                                    <div style="display: inline-block; vertical-align: middle;">
										<span id="brand_product_add_img_upload_span" class="img_thumbnail_add_span">
											<img class="img_upload" id="brand_product_add_img_upload" src="/<%=PropKit.get("project_name") %>/res/images/img_add.png">
										</span>
										<span id="brand_product_add_img_imgs_div">
										</span>
										<input id="brand_product_add_imgpath" name="brand_product_add_imgpath" type="hidden" value="" />
						            </div>
                                </div>
                            </div>
                            
                            <div class="form-group">
                                <label class="col-sm-3 control-label">轮播图片：</label>
                                <div class="col-sm-8">
                                    <div style="display: inline-block; vertical-align: middle;">
										<span id="brand_product_add_lb_img_upload_span" class="img_thumbnail_add_span">
											<img class="img_upload" id="brand_product_add_lb_img_upload" src="/<%=PropKit.get("project_name") %>/res/images/img_add.png">
										</span>
										<span id="brand_product_add_lb_img_imgs_div">
										</span>
										<input id="brand_product_add_lb_imgpath" name="brand_product_add_lb_imgpath" type="hidden" value="" />
						            </div>
                                </div>
                            </div>
                            
                            <div class="form-group">
                                <div class="col-sm-4 col-sm-offset-3">
                                    <button id="submit" class="btn btn-primary" type="button">提交</button>
                                    <button onclick="back();" class="btn btn-info" type="button">返回</button>
                                </div>
                            </div>
                            <input id="imgpath" name="imgpath" type="hidden" value="" />
    						<input id="imgs" name="imgs" type="hidden" value="" />
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
    		$('#brand_product_add_img_imgs_div img[name="img_thumbnail"]').each(function() {
    			imgpath = $(this).attr('src');
    		});
    		$('#imgpath').val(imgpath);
    		
    		var imgs = '';
    		$('#brand_product_add_lb_img_imgs_div img[name="img_thumbnail"]').each(function() {
    			imgs += $(this).attr('src') + '|';
    		});
    		$('#imgs').val(imgs);
    		

    		$.post('/<%=PropKit.get("project_name") %>/admin_new/brand/product_submit/', $('#product_form').serialize(), function(returnJson) {
    			var rescode = returnJson.rescode;
    			var rescnt = returnJson.rescnt;
    			if (rescode == '0000') {
    				window.location.href = '/<%=PropKit.get("project_name") %>/admin_new/brand/product_list/';
    			}
    		});
    		
    	});
    	
    	uploadimg('brand_product_add_', 1);
    	uploadimg('brand_product_add_lb_', 2);
    });
    
    function back() {
    	history.back();
    }
    </script>
</body>
</html>
