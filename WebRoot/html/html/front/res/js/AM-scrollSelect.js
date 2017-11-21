



/*
滚动选择
移动端
*/

function A_ScrollSelect(div){//传进来的或许是一个div id 也可能是一个jQuery div
	
	this._liH = 33;
	this._locationY = 0;//上一次的坐标
	this._locationStart = 0;//开始触摸时的坐标
	
//	----------------------------
	this._H_action = 50;
	this._H_2 = 36;
	this._H_3 = 33;
	this._H_hide = 33;
	
	this._H_ul = 188;
	this._top_max = 0;
//	--------------------------------------
	
	this._init = false;
	
	this.reLoad = function(data){
		this._box.empty();
		this._init = false;
		
		this.init(data);
	}
	this.init = function(data){
		if(this._init){return;}
		if(typeof div == 'string'){
			var box = $('#'+div);
		}else{
			var box = div;
		}
		
		this._box = box;
		this._data = data;
		
		if(data){
			 this.createDOM(data);
			 this._num = data.length;
		}
		this.bindEvent();
		
		this.setTop(2);//设置顶部高度
		this.setGear(2);//置初值
		this._init = true;
	}
	
	this.createDOM = function(data){
		var html = '';
		html+='<div class="AM-scrollSelect-box">';
		html+='<ul>';
		html+='<li class="list-title-hide"></li>';
		html+='<li class="list-title-hide"></li>';
		
		for(var i=0;i<data.length;i++){
			html+='<li class="list-title-hide"> ' + data[i] + ' </li>';
		}	
		html+='</ul>';
		html+='</div>';
		this._box.append($(html));
	}
	this.bindEvent = function(){
		var self = this;
		var box = this._box;
			
		box.on('touchstart',function(e){
			self.gearTouchStart(e);
		});
		box.on('touchmove',function(e){
			self.gearTouchMove(e);
		});
		box.on('touchend',function(e){
			self.gearTouchEnd(e);
		});
	}
 	//触摸开始
    this.gearTouchStart = function(e) {
		var y = e.originalEvent.changedTouches[0].pageY;
		this._locationStart = y;//初始值
		this._locationY = y;

    }
    //手指移动
    this.gearTouchMove = function(e) {
    	var self = this;
		var y = e.originalEvent.changedTouches[0].pageY;
		var ul = this._box.find('ul');		
		var marginTop = parseFloat(ul.css('margin-top'));
		var seat_y = this._locationY;//上一次的位置
		var y_result = marginTop + y - seat_y;
		
		var min = (this._num-1) * this._H_hide * -1;
		if(marginTop>0){
			y_result = 0;
		}
		if(marginTop<min){
			y_result  = min;
		}
		
		ul.stop();//停止当前动画
		ul.css({'margin-top':y_result});//滚动
		seat_y = y;
		var h_li = this._liH;//单个列的高
		var margin = marginTop;
		var difference = Math.abs(marginTop - seat_y);

	//	变换样式
		if(difference > h_li/2){
			
			var multiple = parseInt(margin/h_li) * -1 ;

			this.setGear(multiple);
		}
		this._locationY = y;
    }
    //离开屏幕
    this.gearTouchEnd = function(e) {
    	var ul = this._box.find('ul');	
	//	取整
		var h_li = this._liH;
		var margin = parseFloat(ul.css('margin-top'));
		var difference = margin % h_li;
			
		if(difference > h_li/2){
			y_result = margin - difference + h_li;
		}else{
			y_result = margin - difference;
		}

		var min = (this._num-1) * this._H_hide * -1;
		if(margin > 0){
			y_result = 0;
		}
		if(margin < min){
			y_result = min;
		}
		ul.animate({'margin-top':y_result},'normal');
    }
	this.getValue = function(){
		return this._box.find('.list-title-action').html();
	}
    //控制插件滚动后停留的值
    this.setGear = function(val) {
    	var multiple = val;
    	var li = this._box.find('li');
    	if(val < 0||val>(this._num-1)){return;}

		li.attr('class','list-title-hide');
		li.eq(multiple).attr('class','list-title-3');
		li.eq(multiple+1).attr('class','list-title-2');
		li.eq(multiple+2).attr('class','list-title-action');
		li.eq(multiple+3).attr('class','list-title-2');
		li.eq(multiple+4).attr('class','list-title-3');
        
    }
    this.setTop = function(n){
    	var self = this;
    	var value = n;//减去标题2和标题3  再加上两天假数据
    	if(value < 0){value = 0;}
    	if(value >= self._num-1){value = self._num-1;} 	
    	var ul = this._box.find('ul');	
    	var h = this._H_hide;
		ul.animate({'margin-top':-1*h*n},'normal');
    }
}































































