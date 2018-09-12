//添加回调函数， 在定时器停止的时候添加，并进行参数传递
function animate(obj,json,fn){
    clearInterval(obj.timer);
    obj.timer = setInterval(function () {//开启定时器部分
        //判断是否停止定时的对象，必须写在遍历外面
        var flag= true;
        //遍历json数据
        for(var attr in json){
            var current = 0;
            if(attr == "opacity"){//判断透明  适应不同的浏览器
                current= Math.round(parseInt(getStyle(obj,attr))*100) ||0;
            }
            else{
                current = parseInt(getStyle(obj,attr));
            }
            var step = (json[attr] - current)/10;//步长就等于  目标位置-现在位置   /10
            step = step >0 ? Math.ceil(step) :Math.floor(step);
            if(attr == "opacity"){//判断用户有没有输入透明度
                if("opacity" in obj.style){//判断我们的浏览器是否支持这个透明度
                    obj.style.opacity =(current +step) /10;
                }
                else{
                    obj.style.filter = "alpha(opacity="+(current + step)* 10+")";
                }
            }
            else if(attr == "zIndex")
            {
                obj.style.zIndex = json[attr];
            }
            else{
                obj.style[attr]= current +step+"px";//走的路程
            }


            if(current!= json[attr]){//只有有不满足条件的，定时器不会停止
                flag = false;
            }
        }
        if(flag){
            clearInterval(obj.timer);
            if(fn){
                fn()
            }
        }

    },10)
}
//获取现在位置的值
function getStyle(obj,attr){
    if(obj.currentStyle){
        return obj.currentStyle[attr];
    }
    else{
        return window.getComputedStyle(obj,null)[attr];
    }
}
