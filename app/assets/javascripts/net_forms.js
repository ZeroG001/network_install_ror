/*# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
*/
(function($, window, document) {

  //locally scoped variables

  $(function(){


    $("body").click(function(e){
      if($(e.target).is(':not(.sidebar, .sidebar *, .sidebar-button)')) {
        console.log("You clicked outside the sidebar");
        console.log($(window).width());
        if ($(window).width() < 768 && !$(".sidebar").hasClass("hidden-xs")) {
          $('.sidebar-button').trigger("click");
        }
      }
    });

      $sidebar_button = $('.sidebar-button');
      $sidebar = $(".sidebar");

      $sidebar_button.click(function(){
     
     if($(".sidebar").hasClass("sidebarSlideIn") || $(".sidebar").hasClass("sidebarSlideIn")) {
      return false;
     }

     if($(".sidebar").hasClass("hidden-xs")) {
      $(".sidebar").removeClass("hidden-xs");
      $(".sidebar").addClass("sidebarSlideOut");
      $(":not(a)").click(function( event ){
          console.log("Hello");
        });

      setTimeout(function(){
        $(".sidebar").removeClass("sidebarSlideOut");
      },500); 

     
     } else if (!$(".sidebar").hasClass("hidden-xs") && !$(".sidebar").hasClass("sidebarSlideOut") ) { //&& !$(".sidebar").hasClass("sidebarSlideOut")
      $(".sidebar").addClass("sidebarSlideIn")
      setTimeout(function(){
        $(".sidebar").addClass("hidden-xs");
        $(".sidebar").removeClass("sidebarSlideIn");
      },500);
     }

    }); // Click function end

//Changes attributes of the input field basted on what you click in the search dropdown  box
$dropdown_item = $(".dropdown-menu li");
  $dropdown_item.click(function(){
    if($(this).is(".dropdown-agent-name")){

      $(".search-input").val('');
      $(".search-input").attr("placeholder", "Agent Name");
      $(".search-input").attr("name", "full_Name");
      $(".search-input").attr("id", "full_name");

    } else if($(this).is(".dropdown-computer-name")) {

      $(".search-input").val('');
      $(".search-input").attr("placeholder", "Computer Name");
      $(".search-input").attr("name", "cpu_name");
      $(".search-input").attr("id", "cpu_name");
    }
  });

  }); // End jquery

} (window.jQuery, window, document));



    