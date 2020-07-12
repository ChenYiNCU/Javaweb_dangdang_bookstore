
        $(document).ready(function(e){

            $("#d1").click(function(e){
                $("#box7").animate({height:0},2000);
            });

        });
 
        var k=0;
        var timer;
        $(document).ready(function(e){
            function showpic(){
                $("#sub1 img").each(function(index){
                    if(index==k)
                    {
                        $(this).fadeIn(1000);
                    }
                    else{
                        $(this).css({display:'none'});
                    }

                });

                $("#imgc li").each(function(index){
                    if(index==k)
                    {
                        $(this).css({background:'red'});
                    }
                    else{
                        $(this).css({background:'white'});
                    }

                });

                if(k>=$("#sub1 img").length-1)
                {
                    k=0;
                }
                else{
                    k++;
                }

            }

            timer=setInterval(showpic,3000);

            $("#sub1").mouseover(function(){
                clearInterval(timer);
            });
            //，移开
            $("#sub1").mouseout(function(){
                timer=setInterval(showpic,3000);
            });

            $("#imgc li").mouseover(function(){
                k=$(this).val();
                showpic();
            });
        });

        var k1=0;
        $(document).ready(function(e){
            function show1(){
                $("#sub31 img").each(function(index){
                    if(index==k1){
                        $(this).css({display:'block'});
                    }
                    else{
                        $(this).css({display:'none'});
                    }
                });
                $("#imgc1 li").each(function(index){
                    if(index==k1){
                        $(this).css({background:'green'});
                    }
                    else{
                        $(this).css({background:'gainsboro'});
                    }

                });
            }
            $("#imgc1 li").mouseover(function(){
                k1=$(this).val();
                show1();
            });
            $("#i1").click(function(){
                if(k1==0){
                    k1=4;
                }else{
                    k1=k1-1;
                }
                show1();
            });
            $("#i2").click(function(){
                if(k1==4)
                {
                    k1=0;
                }
                else{
                    k1=k1+1;
                }
                show1();
            });
        });
