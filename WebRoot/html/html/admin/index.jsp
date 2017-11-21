<%@ page import="com.jfinal.kit.PropKit"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="zh">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title><%=PropKit.get("project_title") %></title>
<!-- bootstrap - css -->
<link href="/<%=PropKit.get("project_name") %>/res/BJUI/themes/css/bootstrap.css" rel="stylesheet">
<!-- core - css -->
<link href="/<%=PropKit.get("project_name") %>/res/BJUI/themes/css/style.css" rel="stylesheet">
<link href="/<%=PropKit.get("project_name") %>/res/BJUI/themes/default/core.css" id="bjui-link-theme" rel="stylesheet">
<!-- plug - css -->
<link href="/<%=PropKit.get("project_name") %>/res/BJUI/plugins/colorpicker/css/bootstrap-colorpicker.min.css" rel="stylesheet">
<link href="/<%=PropKit.get("project_name") %>/res/BJUI/plugins/niceValidator/jquery.validator.css" rel="stylesheet">
<link href="/<%=PropKit.get("project_name") %>/res/BJUI/plugins/bootstrapSelect/bootstrap-select.css" rel="stylesheet">
<link href="/<%=PropKit.get("project_name") %>/res/BJUI/themes/css/FA/css/font-awesome.min.css" rel="stylesheet">
<!--[if lte IE 7]>
<link href="BJUI/themes/css/ie7.css" rel="stylesheet">
<![endif]-->
<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!--[if lte IE 9]>
    <script src="/<%=PropKit.get("project_name") %>/res/BJUI/other/html5shiv.min.js"></script>
    <script src="/<%=PropKit.get("project_name") %>/res/BJUI/other/respond.min.js"></script>
<![endif]-->
<!-- jquery -->
<script src="/<%=PropKit.get("project_name") %>/res/BJUI/js/jquery-1.10.2.min.js"></script>
<script src="/<%=PropKit.get("project_name") %>/res/BJUI/js/jquery.cookie.js"></script>
<!--[if lte IE 9]>
<script src="/<%=PropKit.get("project_name") %>/res/BJUI/other/jquery.iframe-transport.js"></script>    
<![endif]-->
<!-- BJUI.all 分模块压缩版 -->
<script src="/<%=PropKit.get("project_name") %>/res/BJUI/js/bjui-all.js"></script>
<!-- 以下是B-JUI的分模块未压缩版，建议开发调试阶段使用下面的版本 -->
<!-- plugins -->
<!-- swfupload for uploadify && kindeditor -->
<script src="/<%=PropKit.get("project_name") %>/res/BJUI/plugins/swfupload/swfupload.js"></script>
<!-- colorpicker -->
<script src="/<%=PropKit.get("project_name") %>/res/BJUI/plugins/colorpicker/js/bootstrap-colorpicker.min.js"></script>
<!-- ztree -->
<script src="/<%=PropKit.get("project_name") %>/res/BJUI/plugins/ztree/jquery.ztree.all-3.5.js"></script>
<!-- nice validate -->
<script src="/<%=PropKit.get("project_name") %>/res/BJUI/plugins/niceValidator/jquery.validator.js"></script>
<script src="/<%=PropKit.get("project_name") %>/res/BJUI/plugins/niceValidator/jquery.validator.themes.js"></script>
<!-- bootstrap plugins -->
<script src="/<%=PropKit.get("project_name") %>/res/BJUI/plugins/bootstrap.min.js"></script>
<script src="/<%=PropKit.get("project_name") %>/res/BJUI/plugins/bootstrapSelect/bootstrap-select.min.js"></script>
<script src="/<%=PropKit.get("project_name") %>/res/BJUI/plugins/bootstrapSelect/defaults-zh_CN.min.js"></script>
<!-- icheck -->
<script src="/<%=PropKit.get("project_name") %>/res/BJUI/plugins/icheck/icheck.min.js"></script>
<!-- dragsort -->
<script src="/<%=PropKit.get("project_name") %>/res/BJUI/plugins/dragsort/jquery.dragsort-0.5.1.min.js"></script>
<!-- HighCharts -->
<script src="/<%=PropKit.get("project_name") %>/res/BJUI/plugins/highcharts/highcharts.js"></script>
<script src="/<%=PropKit.get("project_name") %>/res/BJUI/plugins/highcharts/highcharts-3d.js"></script>
<script src="/<%=PropKit.get("project_name") %>/res/BJUI/plugins/highcharts/themes/gray.js"></script>
<!-- ECharts -->
<script src="/<%=PropKit.get("project_name") %>/res/BJUI/plugins/echarts/echarts.js"></script>
<!-- other plugins -->
<script src="/<%=PropKit.get("project_name") %>/res/BJUI/plugins/other/jquery.autosize.js"></script>
<link href="/<%=PropKit.get("project_name") %>/res/BJUI/plugins/uploadify/css/uploadify.css" rel="stylesheet">
<script src="/<%=PropKit.get("project_name") %>/res/BJUI/plugins/uploadify/scripts/jquery.uploadify.min.js"></script>
<script src="/<%=PropKit.get("project_name") %>/res/BJUI/plugins/download/jquery.fileDownload.js"></script>
<script src="/<%=PropKit.get("project_name") %>/res/BJUI/other/md5/jquery.md5.js"></script>

<!-- kindeditor -->
<script src="/<%=PropKit.get("project_name") %>/res/BJUI/plugins/kindeditor_4.1.10/kindeditor-all-new.js"></script>
<script src="/<%=PropKit.get("project_name") %>/res/BJUI/plugins/kindeditor_4.1.10/lang/zh_CN.js"></script>

<script charset="utf-8" src="http://map.qq.com/api/js?v=2.exp&key=FVDBZ-T3EKR-XUJWJ-WG5AU-PDVY2-X7FVH"></script>

<!--video所需js文件-->
<script type="text/javascript" src="/<%=PropKit.get("project_name") %>/res/BJUI/other/videojs/video.js"></script>
<!--video所需css文件-->
<link href="/<%=PropKit.get("project_name") %>/res/BJUI/other/videojs/video-js.css" rel="stylesheet" type="text/css">
<!--video所需flash文件-->
<script>
	videojs.options.flash.swf = "/<%=PropKit.get("project_name") %>/res/BJUI/other/videojs/video-js.swf";
</script>

<!--上传视频-->
<script type="text/javascript" src="/<%=PropKit.get("project_name") %>/res/BJUI/other/plupload/js/plupload.full.min.js"></script>
<script type="text/javascript" src="/<%=PropKit.get("project_name") %>/res/BJUI/other/qiniu/qiniu.min.js"></script>


<style type="text/css">
.img_add { width: 100px; height: 100px; cursor: pointer; }
.img_show { width: 100px; height: 100px; }
.img_thumbnail_span {
		position:relative;
		display: inline-block;
		float: left;
		width: 104px;
		height: 104px;
		margin-right: 10px;
		margin-bottom: 5px;
		padding: 1px;
		text-align: center;
		border: 1px solid #ddd;
	}
	
	.img_thumbnail {
		max-width: 100px;
		max-height: 100px;
		cursor: pointer;
	}
	
	.img_thumbnail_del {
		position: absolute;
		height:30px;
		width:30px;
		cursor:pointer;
		left: 85px;
		top: -10px;
	}
	
	.img_thumbnail_add_span {
		display: inline-block;
		float: left;
		width: 104px;
		height: 104px;
		margin-right: 10px;
		margin-bottom: 5px;
		padding: 1px;
	}
	
	.img_thumbnail_add_span img {
		max-width: 104px;
		max-height: 104px;
		cursor: pointer;
	}
</style>

<!-- init -->
<script type="text/javascript">
$(function() {
    BJUI.init({
        JSPATH       : '/<%=PropKit.get("project_name") %>/res/BJUI/',         //[可选]框架路径
        PLUGINPATH   : '/<%=PropKit.get("project_name") %>/res/BJUI/plugins/', //[可选]插件路径
        loginInfo    : {url:'/<%=PropKit.get("project_name") %>/admin/timeout', title:'登录超时', width:300, height:100}, // 会话超时后弹出登录对话框
        statusCode   : {ok:200, error:300, timeout:301}, //[可选]
        ajaxTimeout  : 50000, //[可选]全局Ajax请求超时时间(毫秒)
        pageInfo     : {total:'total', pageCurrent:'pageCurrent', pageSize:'pageSize', orderField:'orderField', orderDirection:'orderDirection'}, //[可选]分页参数
        alertMsg     : {displayPosition:'topcenter', displayMode:'slide', alertTimeout:3000}, //[可选]信息提示的显示位置，显隐方式，及[info/correct]方式时自动关闭延时(毫秒)
        keys         : {statusCode:'statusCode', message:'message'}, //[可选]
        ui           : {
                         windowWidth      : 0,    //框架可视宽度，0=100%宽，> 600为则居中显示
                         showSlidebar     : true, //[可选]左侧导航栏锁定/隐藏
                         clientPaging     : true, //[可选]是否在客户端响应分页及排序参数
                         overwriteHomeTab : false //[可选]当打开一个未定义id的navtab时，是否可以覆盖主navtab(我的主页)
                       },
        debug        : true,    // [可选]调试模式 [true|false，默认false]
        theme        : 'default' // 若有Cookie['bjui_theme'],优先选择Cookie['bjui_theme']。皮肤[五种皮肤:default, orange, purple, blue, red, green]
    })
    
    // main - menu
    $('#bjui-accordionmenu')
        .collapse()
        .on('hidden.bs.collapse', function(e) {
            $(this).find('> .panel > .panel-heading').each(function() {
                var $heading = $(this), $a = $heading.find('> h4 > a')
                
                if ($a.hasClass('collapsed')) $heading.removeClass('active')
            })
        })
        .on('shown.bs.collapse', function (e) {
            $(this).find('> .panel > .panel-heading').each(function() {
                var $heading = $(this), $a = $heading.find('> h4 > a')
                
                if (!$a.hasClass('collapsed')) $heading.addClass('active')
            })
        })
    
    $(document).on('click', 'ul.menu-items > li > a', function(e) {
        var $a = $(this), $li = $a.parent(), options = $a.data('options').toObj()
        var onClose = function() {
            $li.removeClass('active')
        }
        var onSwitch = function() {
            $('#bjui-accordionmenu').find('ul.menu-items > li').removeClass('switch')
            $li.addClass('switch')
        }
        
        $li.addClass('active')
        if (options) {
            options.url      = $a.attr('href')
            options.onClose  = onClose
            options.onSwitch = onSwitch
            if (!options.title) options.title = $a.text()
            
            if (!options.target)
                $a.navtab(options)
            else
                $a.dialog(options)
        }
        
        e.preventDefault()
    })
    
    //时钟
    var today = new Date(), time = today.getTime()
    $('#bjui-date').html(today.formatDate('yyyy/MM/dd'))
    setInterval(function() {
        today = new Date(today.setSeconds(today.getSeconds() + 1))
        $('#bjui-clock').html(today.formatDate('HH:mm:ss'))
    }, 1000)
})

//菜单-事件
function MainMenuClick(event, treeId, treeNode) {
    event.preventDefault()
    
    if (treeNode.isParent) {
        var zTree = $.fn.zTree.getZTreeObj(treeId)
        
        zTree.expandNode(treeNode, !treeNode.open, false, true, true)
        return
    }
    
    if (treeNode.target && treeNode.target == 'dialog')
        $(event.target).dialog({id:treeNode.tabid, url:treeNode.url, title:treeNode.name})
    else
        $(event.target).navtab({id:treeNode.tabid, url:treeNode.url, title:treeNode.name, fresh:treeNode.fresh, external:treeNode.external})
}
</script>
</head>
<body>
    <!--[if lte IE 7]>
        <div id="errorie"><div>正常使用系统前请升级您的浏览器到 IE8以上版本 <a target="_blank" href="http://windows.microsoft.com/zh-cn/internet-explorer/ie-8-worldwide-languages">点击升级</a>&nbsp;&nbsp;强烈建议您更改换浏览器：<a href="http://down.tech.sina.com.cn/content/40975.html" target="_blank">谷歌 Chrome</a></div></div>
    <![endif]-->
    <div id="bjui-window">
    <header id="bjui-header">
        <div class="bjui-navbar-header">
            <button type="button" class="bjui-navbar-toggle btn-default" data-toggle="collapse" data-target="#bjui-navbar-collapse">
                <i class="fa fa-bars"></i>
            </button>
            <span style="font-size:24px; line-height:32px; color:#fff; margin-left:10px;"><%=PropKit.get("project_title") %></span>
        </div>
        <nav id="bjui-navbar-collapse">
            <ul class="bjui-navbar-right" style="padding-right:5px;">
                <li class="datetime"><div><span id="bjui-date"></span> <span id="bjui-clock"></span></div></li>
                <li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown">我的账户 <span class="caret"></span></a>
                    <ul class="dropdown-menu" role="menu">
                        <li><a href="javascript:;" id="logout" class="red">&nbsp;<span class="glyphicon glyphicon-off"></span> 注销登陆</a></li>
                    </ul>
                </li>
            </ul>
        </nav>
        <div id="bjui-hnav">
            <button type="button" class="btn-default bjui-hnav-more-left" title="导航菜单左移"><i class="fa fa-angle-double-left"></i></button>
            <div id="bjui-hnav-navbar-box">
                <ul id="bjui-hnav-navbar">
                    ${funclisthtml }
                </ul>
            </div>
            <button type="button" class="btn-default bjui-hnav-more-right" title="导航菜单右移"><i class="fa fa-angle-double-right"></i></button>
        </div>
    </header>
    <div id="bjui-container">
        <div id="bjui-leftside">
            <div id="bjui-sidebar-s">
                <div class="collapse"></div>
            </div>
            <div id="bjui-sidebar">
                <div class="toggleCollapse"><h2><i class="fa fa-bars"></i> 导航栏 <i class="fa fa-bars"></i></h2><a href="javascript:;" class="lock"><i class="fa fa-lock"></i></a></div>
                <div class="panel-group panel-main" data-toggle="accordion" id="bjui-accordionmenu" data-heightbox="#bjui-sidebar" data-offsety="26">
                </div>
            </div>
        </div>
        <div id="bjui-navtab" class="tabsPage">
            <div class="tabsPageHeader">
                <div class="tabsPageHeaderContent">
                    <ul class="navtab-tab nav nav-tabs">
                        <li><a href="javascript:;"><span><i class="fa fa-home"></i> #maintab#</span></a></li>
                    </ul>
                </div>
                <div class="tabsLeft"><i class="fa fa-angle-double-left"></i></div>
                <div class="tabsRight"><i class="fa fa-angle-double-right"></i></div>
                <div class="tabsMore"><i class="fa fa-angle-double-down"></i></div>
            </div>
            <ul class="tabsMoreList">
                <li><a href="javascript:;">#maintab#</a></li>
            </ul>
            <div class="navtab-panel tabsPageContent">
                <div class="navtabPage unitBox">
                    <div class="bjui-pageContent" style="background:#FFF;">
                    </div>
                </div>
            </div>
        </div>
    </div>
    <footer id="bjui-footer">Copyright &copy; 2015 - 2016
    </footer>
    </div>
</body>
<script type="text/javascript">
$(function() {
	$('#logout').click(function() {
		$.post("/<%=PropKit.get("project_name") %>/admin/logout", function (returnJson){
			var rescode = returnJson.rescode;
			if (rescode == '0000') {
				window.location.href = '/<%=PropKit.get("project_name") %>/admin/login';
			}
		}, "json");
	});
});


function uploadimg(id, type, event) {
	
	// type 为1时上传一张  2时上传多张
	var Qiniu = new QiniuJsSDK();
	var uploader = Qiniu.uploader({
        runtimes: 'html5,flash,html4',
        browse_button: id + 'img_upload',
        container: id + 'img_upload_span',
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
                 var previewHtml = '<span class="img_thumbnail_span">\r\n';
 					previewHtml += '<img name="img_thumbnail" class="img_thumbnail" src="'+sourceLink+'">\r\n';
 					previewHtml += '<img name="img_thumbnail_del" class="img_thumbnail_del" src="/<%=PropKit.get("project_name") %>/res/images/close.png" />\r\n';
 					previewHtml += '</span>\r\n';
 					if (type == 1) {
 						$.CurrentNavtab.find("#" + id + "img_imgs_div").html(previewHtml);
 					} else {
 						$.CurrentNavtab.find("#" + id + "img_imgs_div").append(previewHtml);
 					}
 					
 					$.CurrentNavtab.find("#" + id + "img_imgs_div img[name='img_thumbnail_del']").unbind('click');
 					$.CurrentNavtab.find("#" + id + "img_imgs_div img[name='img_thumbnail_del']").bind('click', function(a) {
 						var $$ = $(this);
 						$(this).alertmsg('confirm', '确认删除', {okName:'确定', cancelName:'取消', okCall:function() {
 							$$.parent().remove();
 						}})
 					});
 					
 					$.CurrentNavtab.find("#" + id + "img_imgs_div img[name='img_thumbnail']").unbind('click');
 					$.CurrentNavtab.find("#" + id + "img_imgs_div img[name='img_thumbnail']").bind('click', function(a) {
 						var linkurl = $(this).attr("src");
 						$(this).dialog({id:'dialog-img', url:'/<%=PropKit.get("project_name") %>/admin/upload/showimg?url=' + linkurl, title:'图片'});
 					});
 					
 					event();
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
	
	$.CurrentNavtab.find("#" + id + "img_imgs_div img[name='img_thumbnail_del']").click(function() {
		var $$ = $(this);
		$(this).alertmsg('confirm', '确认删除', {okName:'确定', cancelName:'取消', okCall:function() {
			$$.parent().remove();
		}})
	});
	
	$.CurrentNavtab.find("#" + id + "img_imgs_div img[name='img_thumbnail']").click(function() {
		var linkurl = $(this).attr("src");
		$(this).dialog({id:'dialog-img', url:'/<%=PropKit.get("project_name") %>/admin/upload/showimg?url=' + linkurl, title:'图片'});
	});
}
</script>
</html>