/*# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
*/
$("document").ready(function(){

	$sidebar_button = $('.sidebar-button');
  $sidebar = $(".sidebar");

	$sidebar_button.click(function(){
		
		// $sidebar.toggleClass(function(){
  //     if($(this).hasClass("hidden-xs")) {
  //       return "hidden-xs"
  //     } else {
  //       setTimeout(function(){
  //         return "hidden-xs"
  //       },1000);
  //     }
      
  //   });

    if($sidebar.hasClass("sidebarSlideOut")) {
      $sidebar.addClass("sidebarSlideIn");
      setTimeout(function(){
        $sidebar.addClass("hidden-xs");
        $sidebar.removeClass("sidebarSlideOut");
        $sidebar.removeClass("sidebarSlideIn");
      },1000);
    } else {
      $sidebar.removeClass("sidebarSlideIn");
      $sidebar.removeClass("hidden-xs");
      $sidebar.addClass("sidebarSlideOut");
    }


    // $sidebar.toggleClass(function(){
    //   if ($sidebar.hasClass("hidden-xs")) {
    //     return "sidebarSlideIn"
    //   } else {
    //     return "sidebarSlideOut"
    //   }

    // }); 

	}); // Click function end


}); // Document function end


    