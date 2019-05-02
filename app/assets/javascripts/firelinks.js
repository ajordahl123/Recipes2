$(function(){
    var kKeys = [];
    function Kpress(e){
        kKeys.push(e.keyCode);
        if (kKeys.toString().indexOf("38,38,40,40,37,39,37,39,66,65") >= 0) {
            $(this).unbind('keydown', Kpress);
            firelinks();
        }
    }
    $(document).keydown(Kpress);
});
function firelinks(){
   $('a').toggleClass('diablo');
};
