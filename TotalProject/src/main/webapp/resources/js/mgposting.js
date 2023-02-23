$(document).ready(function(){
	
   $(".menulist>a").click(function(){
      $(this).next("ul").toggleClass("hide");
   });
   
});