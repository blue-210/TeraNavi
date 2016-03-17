$(function(){
    $("#topcommunity").on("click",function(){
        $.ajax({
            url: '/TeraNavi/front/TopLoadCommunity',
            type:'POST',
            dataType: 'json',
            data:null
        })
    });
});
