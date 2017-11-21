$('.header>ul>li:first-child>i').on('touchstart',function(){
	$('.level').show();
})

$(function(){
    var cArr=["p7","p6","p5","p4","p3","p2","p1"];
    var index=0;
    $(".next").click(
        function(){
        nextimg();
        }
    )
    $(".prev").click(
        function(){
        previmg();
        }
    )
    //上一张
    function previmg(){
        cArr.unshift(cArr[6]);
        cArr.pop();
        //i是元素的索引，从0开始
        //e为当前处理的元素
        //each循环，当前处理的元素移除所有的class，然后添加数组索引i的class
       
        $('.box').each(function(index,items){
            $(items).find('.list li').each(function(i,e){
            $(e).removeClass().addClass(cArr[i]);
        })
        })
        index--;
        if (index<0) {
            index=6;
        }
        
    }

    //下一张
    function nextimg(){
        cArr.push(cArr[0]);
        cArr.shift();
        $('.box').each(function(index,items){
            $(items).find('.list li').each(function(i,e){
            $(e).removeClass().addClass(cArr[i]);
        })
        })
        index++;
        if (index>6) {
            index=0;
        }
        
    }


    //点击class为p2的元素触发上一张照片的函数
    $(document).on("click",".p2",function(){
        previmg();
        return false;//返回一个false值，让a标签不跳转
    });

    //点击class为p4的元素触发下一张照片的函数
    $(document).on("click",".p4",function(){
        nextimg();
        return false;
    });

    //          鼠标移入box时清除定时器
    $(".box").mouseover(function(){
        clearInterval(timer);
    })

    //          鼠标移出box时开始定时器
    $(".box").mouseleave(function(){
        timer=setInterval(nextimg,4000);
    })


    // 滑动事件
    $('.box').swipe({
        swipeLeft:function(){
            nextimg();
            return false;
            timer=setInterval(nextimg,4000);
        }
    })
    $('.box').swipe({
        swipeRight:function(){
            previmg();
            return false;
            timer=setInterval(nextimg,4000);
        }
    })



    //          进入页面自动开始定时器
        timer=setInterval(nextimg,4000);

    $('.list .play').click(function(){
        console.log(111)
        $(this).parent().find('video')[0].play();
        $(this).hide();
    })
})

