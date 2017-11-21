<%@ page import="com.jfinal.kit.PropKit"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<script type='text/javascript' src='https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js' charset='utf-8'></script>
<script>var Zepto = jQuery</script>
<script type='text/javascript' src='//g.alicdn.com/msui/sm/0.6.2/js/sm.min.js' charset='utf-8'></script>
<script type='text/javascript' src='//g.alicdn.com/msui/sm/0.6.2/js/sm-extend.min.js' charset='utf-8'></script>
<script type='text/javascript' src='<%=PropKit.get("front_prefix") %>mine/res/js/layer.js' charset='utf-8'></script>
<script type='text/javascript' src='<%=PropKit.get("front_prefix") %>mine/res/js/swiper.js' charset='utf-8'></script>
<script type="text/javascript" src="http://res.wx.qq.com/open/js/jweixin-1.2.0.js"></script>
<script type="text/javascript">
</script>

<script>

var screenWidth = window.screen.width;
var proportion = screenWidth / 640;

if(screenWidth > 640) {
	screenWidth = 640;
	proportion = 1;
}

$('.popup_content1').height($('.page-current').height() - 46);

function toast(content) {
	layer.open({content: content ,skin: 'msg' ,time: 2 });
}
</script>

