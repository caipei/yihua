/**
 * Created by zhang on 2016/10/13.
 */
$(function () {
    product_list();
    product();
    App_Img();
    csfc_swiper();
});
product_list= function () {
    var oWinH=$(window).width();
    $('#product_list').find(".banner").height(oWinH*1.054);
    if($(".swiper-container").length!=0){
        var mySwiper = new Swiper ('.swiper-container', {
            pagination: '.swiper-pagination',
            paginationClickable: true,
            spaceBetween: 30,
            centeredSlides: true,
            autoplay: 2500,
            autoplayDisableOnInteraction: false
        });
    }
}
product= function () {
    if($(".swiper-1").length!=0){
        var swiper = new Swiper('.swiper-1', {
            pagination: '.swiper-pagination',
            paginationClickable: true,
            spaceBetween: 30,
        });
    }
};
App_Img= function () {
    var oImg=$(".swiper-slide");
    $("#product_details").after("<div class='bomb-box'><img src='' alt=''/></div>");
    $("#theme_list_nei-csfc").after("<div class='bomb-box'><img src='' alt=''/></div>");
    var oBombBox=$(".bomb-box");
    for(var i=0;i<oImg.length;i++){
        (function (_i) {
            oImg.eq(i).click(function () {
                var oStr=oImg.eq(_i).css("background-image");
                    //alert(oStr.slice(4,-1));
                oBombBox.css({"display":"block"});
                oBombBox.find("img").attr("src",oStr.slice(4,-1));
            })
        })(i)
    }
    oBombBox.click(function () {
        oBombBox.css({"display":"none"});
    })
}
csfc_swiper= function () {
    if($(".csfc-1").length!=0){
        var swiper = new Swiper('.csfc-1', {
            pagination: '.swiper-pagination',
            paginationClickable: true,
            spaceBetween: 30,
        });
    }
    if($(".csfc-2").length!=0){
        var swiper = new Swiper('.csfc-2', {
            pagination: '.swiper-pagination',
            paginationClickable: true,
            spaceBetween: 30,
        });
    }
    if($(".csfc-3").length!=0){
        var swiper = new Swiper('.csfc-3', {
            pagination: '.swiper-pagination',
            paginationClickable: true,
            spaceBetween: 30,
        });
    }
}