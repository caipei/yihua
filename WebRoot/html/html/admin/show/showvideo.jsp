<%@ page import="com.jfinal.kit.PropKit"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
<div class="bjui-pageContent" style="text-align:center; padding:0px;">
	<video id="video" class="video-js vjs-default-skin vjs-big-play-centered" controls preload="auto" autoplay="autoplay" width="100%" height="100%" data-setup=''>
	  <source src="${url }" type='video/mp4' />
	</video>  
</div>
