/**
 * Created by imac on 16/5/20.
 */
$(document).ready(function(){
    // 切换咨询类型
    $('.left_box_link li').hover(function(){
        if($(this).find('.img1').is(':visible')){
            $(this).find('.img1').hide();
            $(this).find('.text1').show();
        }else {
            $(this).find('.img1').show();
            $(this).find('.text1').hide();
        }
    })
    //
})
// 满意度评价输入框字数判断
$(function(){
    var $tex=$(".tex");
    var $but=$(".but");
    var ie=jQuery.support.htmlSerialize;
    var str=0;
    var abcnum=0;
    var maxNum=60;
    var texts=0;

    $tex.val("");
    $tex.focus(function(){
        if($tex.val()=="")
        {
            $(".p_text").html("您还可以输入的字数<span>30</span>");
        }
    })
    $tex.blur(function(){
        if($tex.val() == "")
        {
            $(".p_text").html("请在下面输入您的意见和建议：");
        }
    })
    if(ie)
    {
        $tex[0].oninput = changeNum;
    }
    else
    {
        $tex[0].onpropertychange  = changeNum;
    }

    function changeNum()
    {
        //汉字的个数
        str=($tex.val().replace(/\w/g,"")).length;
        //非汉字的个数
        abcnum=$tex.val().length-str;
        total=str*2+abcnum;
        if(str*2+abcnum<maxNum||str*2+abcnum==maxNum)
        {
            $but.removeClass()
            $but.addClass("but");
            texts=Math.ceil((maxNum-(str*2+abcnum))/2);
            $(".p_text").html("您还可以输入的字数<span>"+texts+"</span>").children().css({"color":"blue"});
        }
        else if(str*2+abcnum>maxNum)
        {
            $but.removeClass("")
            $but.addClass("grey");
            texts =Math.ceil(((str*2+abcnum)-maxNum)/2);
            $(".p_text").html("您输入的字数超过了<span>"+texts+"</span>").children("span").css({"color":"red"});
        }
    }
})
function evalu(){
    $("#mymodal").modal("toggle");
}