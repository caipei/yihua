<%@ page import="com.jfinal.kit.PropKit"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="../../meta.jsp"></jsp:include>    
	<title>积分商品-新增</title>
</head>

<body class="gray-bg">
    <div class="wrapper wrapper-content animated fadeInRight">
        <div class="row">
            <div class="col-sm-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-content">
                        <form class="form-horizontal m-t" id="hyzshd_form">
                            <div class="form-group">
                                <label class="col-sm-3 control-label">名称：</label>
                                <div class="col-sm-8">
                                    <input id="name" name="name" type="text" value="" class="form-control" required="" aria-required="true" aria-required="true">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">类型：</label>
                                <div class="col-sm-8">
                                    <select class="form-control" id="type_sel" onchange="change_type();">
                                        <option value="1">商品</option>
                                        <option value="2">礼金券</option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">所需积分：</label>
                                <div class="col-sm-8">
                                    <input id="jf" name="jf" type="number" value="0" class="form-control" required="" aria-required="true" aria-required="true">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">所需金额：</label>
                                <div class="col-sm-8">
                                    <input id="price" name="price" type="number" value="0" class="form-control" required="" aria-required="true" aria-required="true">
                                </div>
                            </div>
                            <div class="form-group" id="scsp_div">
                                <label class="col-sm-3 control-label">手寸商品：</label>
                                <div  class="col-sm-8">
                                    <div class="checkbox i-checks">
                                        <label onclick="change_issc();"><input type="checkbox" checked id="issc" value=""><i></i>是</label>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group" id="scxh_div">
                                <label class="col-sm-3 control-label">手寸型号(多个用‘|’分隔)：</label>
                                <div  class="col-sm-8">
                                    <textarea id="scxh" class="form-control"></textarea>
                                </div>
                            </div>
                            <div class="form-group" id="xxcs_div">
                                <label class="col-sm-3 control-label">详细参数(多个用‘|’分隔)：</label>
                                <div  class="col-sm-8">
                                    <textarea id="xxcs" class="form-control"></textarea>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">库存：</label>
                                <div class="col-sm-8">
                                    <input id="kucun" name="kucun" type="number" value="0" class="form-control" required="" aria-required="true" aria-required="true">
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
										<input id="hyzshd_add_imgpath" name="hyzshd_add_imgpath" type="hidden" value="" />
						            </div>
                                </div>
                            </div>
                            
                            <div class="form-group">
                                <label class="col-sm-3 control-label">图文详情：</label>
                                <div class="col-sm-8">
                                    <div id="content"></div>
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
    
    var E = window.wangEditor;
    var editor;
    
    $(document).ready(function(){
    	$('#submit').click(function() {
    		var imgpath = '';
    		$('#hyzshd_add_img_imgs_div img[name="img_thumbnail"]').each(function() {
    			imgpath = $(this).attr('src');
    		});
    		$('#imgpath').val(imgpath);

    		var params = {};
    		params.name = $('#name').val();
    		params.type = $('#type_sel').val();
    		params.jf = $('#jf').val();
    		params.price = $('#price').val();
    		params.issc = 0;
			$("#issc:checked").each(function () {
				params.issc = 1;
            });
    		params.xxcs = $('#xxcs').val();
    		params.scxh = $('#scxh').val();
    		params.kucun = $('#kucun').val();
    		params.imgpath = imgpath;
    		params.content = editor.txt.html();
    		$.post('/<%=PropKit.get("project_name") %>/admin_new/mine/jfgoods/submit/', params, function(returnJson) {
    			var rescode = returnJson.rescode;
    			var rescnt = returnJson.rescnt;
    			if (rescode == '0000') {
    				window.location.href = '/<%=PropKit.get("project_name") %>/admin_new/mine/jfgoods/';
    			}
    		});
    	});
    	
    	$(".i-checks").iCheck({checkboxClass:"icheckbox_square-green",radioClass:"iradio_square-green",});
    	
    	$('#issc').on('ifChecked', function(event){
    		$('#scxh_div').show();
    	});
    	
    	$('#issc').on('ifUnchecked', function(event){
    		$('#scxh_div').hide();
    	});
    	
		editor = new E('#content');
    	
        editor.customConfig.menus = editorconfigmenus;
        editor.customConfig.uploadImgShowBase64 = false;
        editor.customConfig.showLinkImg = false;
        editor.customConfig.uploadImgServer = '/<%=PropKit.get("project_name") %>/admin_new/upload/wang_upload';
        editor.customConfig.uploadImgFileName = 'wangimg';
        editor.create()
    	
    	$('#starttime').datepicker({format: "yyyy-mm-dd",autoclose: true});
    	
    	$('#endtime').datepicker({format: "yyyy-mm-dd",autoclose: true});
    	
    	uploadimg('hyzshd_add_', 1);
    	
    });
    
    function change_issc() {
    	console.info(111)
    	var flag = false;
    	$("#issc:checked").each(function () {
    		flag = true;
        });
    	if (flag) {
    		$('#scxh_div').show();
    	} else {
    		$('#scxh_div').hide();
    	}
    }
    
    function change_type() {
    	var type = $('#type_sel').val();
    	if (type == 1) {
    		$('#scsp_div').show();
    		$('#xxcs_div').show();
    		$('#scxh_div').hide();
    		$("#issc:checked").each(function () {
    			$('#scxh_div').show();
            });
    	} else if (type == 2) {
    		$('#scsp_div').hide();
    		$('#xxcs_div').hide();
    		$('#scxh_div').hide();
    	}
    }
    
    function back() {
    	history.back();
    }
    </script>
</body>
</html>
