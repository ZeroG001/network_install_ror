/*# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
*/
(function($, window, document) {

  //locally scoped variables

  $(function(){

      $sidebar_button = $('.sidebar-button');
      $sidebar = $(".sidebar");

      $sidebar_button.click(function(){
     
     if($sidebar.hasClass("sidebarSlideIn") || $sidebar.hasClass("sidebarSlideIn")) {
      return false;
     }

     if($sidebar.hasClass("hidden-xs")) {
      $sidebar.removeClass("hidden-xs");
      $sidebar.addClass("sidebarSlideOut");
      setTimeout(function(){
        $sidebar.removeClass("sidebarSlideOut");
      },500); 
     } else if (!$sidebar.hasClass("hidden-xs") && !$sidebar.hasClass("sidebarSlideOut") ) {
      $sidebar.addClass("sidebarSlideIn")
      setTimeout(function(){
        $sidebar.addClass("hidden-xs");
        $sidebar.removeClass("sidebarSlideIn");
      },500);
     } 

    }); // Click function end
  });

} (window.jQuery, window, document));



    