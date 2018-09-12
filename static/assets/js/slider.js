window.onload = function () {
    function $(id){return document.getElementById(id);}

    var wy_slider= $("wy_slider");
    var slider_top=$("slider_top");//图片的父亲
    var imgs = slider_top.children;
    var slider_ctrl=$("slider_ctrl");//span的父盒子



    //for循环添加span标签
    for(var i=0; i<imgs.length; i++){
        var span = document.createElement("span");
        span.className = "slider-cron";
        span.innerHTML = imgs.length -i;//倒叙排列，因为是倒着进行添加的
        slider_ctrl.insertBefore(span,slider_ctrl.children[1]);//在父元素的的第二个孩子里面添加
    }

    //得到所有的span
    var spans = wy_slider.getElementsByTagName("span");
    spans[1].setAttribute("class","slider-cron current");
    var scoller = wy_slider.clientWidth;//得到大盒子的宽度也就是图片要走的距离
    for(var i=1; i<imgs.length;i++){//第一张留下。别的都改变

        imgs[i].style.left = scoller +"px";
    }
    //key决定动画的张数
    var key=0;
    for(var k in spans){
        spans[k].onclick = function () {
            if(this.className == "slider-cron-left"){
               // alert("我是左按钮")
                //开始左动画，当我们点击当前图片是，右侧的下一张图片迅速移动到盒子的左侧（也即是-310px的位置），然后缓缓进入到中间
                animate(imgs[key],{left:scoller});
                --key<0 ? key=imgs.length -1: key;//先自加，在运算
                imgs[key].style.left = -scoller +"px";//迅速回到指定位置
                animate(imgs[key],{left:0});//在舞台中间
                setsquare();

            }
            else if(this.className == "slider-cron-right"){
                ///alert("我是右按钮")
                //开始做动画，当我们点击当前图片时 ，先缓慢的走到左侧，下一张图片一定迅速的走到右侧，在缓慢进入左侧
                autoplay();
            }
            else{
                //alert("w我是其他按钮")
                //首先我们要知道我们点击的是第几张照片，或得当前的索引号(这个位置用this)；获取当前的span的linnerHTML
                var that = this.innerHTML -1;
                //接下来判断是点击当前按钮的左边还是右边
                if(that > key){//大于相当于点击右边按钮
                    animate(imgs[key],{left:-scoller});
                    imgs[that].style.left = scoller+"px";
                }
                else if(that < key){//相当于左边按钮
                    animate(imgs[key],{left:scoller});
                    imgs[that].style.left = -scoller +"px";//迅速回到指定位置
                }
                key = that;//起始点，层叠之前的索引号
                animate(imgs[key],{left:0});

            }
        }
    }
    function setsquare(){
        for(var i= 1; i<spans.length-1;i++){//一共是8个span。只需要1-6
            spans[i].className = "slider-cron";
        }
        spans[key+1].className = "slider-cron current";//使用key +1   是当前的span重点
    }

    //开启定时器
    var timer = null;
    timer = setInterval(autoplay,2000);//开启定时器
    function autoplay(){//定时器的原理相当于右按钮的作用，与其原理相同
        animate(imgs[key],{left:-scoller});
        // key++;//先++ 后判断  在执行
        // if(key > imgs.length-1){
        //     key=0;
        // }对此部分代码就行简化

        ++key>imgs.length-1 ? key=0: key;//先自加，在运算
        imgs[key].style.left = scoller+"px";  //左侧下一张图片迅速移动到右侧
        animate(imgs[key],{left:0});
        setsquare();
    }
    //进行定时器的开关
    wy_slider.onmouseover=function () {
        clearInterval(timer);
        slider_ctrl.style.display="block";
    }
    wy_slider.onmouseout = function () {
        clearInterval(timer);
        timer = setInterval(autoplay,2000);
        //slider_ctrl.style.display="none";
    }
}