/*# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
*/
(function($, window, document) {

  //locally scoped variables

  $(function(){

    // When the user clicks anywhere on the document. Close the sidebar.
    $(document).click(function(e){
      if($(e.target).is(':not(.sidebar, .sidebar *, .sidebar-button)')) {
        console.log("You clicked outside the sidebar");
        console.log($(window).width());
        if ($(window).width() < 768 && !$(".sidebar").hasClass("hidden-xs")) {
          $('.sidebar-button').click();
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

  var new_printer_input = '<div class="new_printer"><input class="printer_input string optional" id="net_form_printer_ip" name="net_form[printer_ip][]" type="text"></input><span class="remove_printer"><div class="btn">-</div></span></div>'
$(".add_printer").click(function(){
    if($(".printers .printer_input").length >= 5) {
      alert("You cannot add more than 5 printers.")
      return false;
    }
    $(".printers").append(new_printer_input);

    $(".remove_printer").click(function(){
    $(this).parent().remove();
  });

  });

  $(".remove_printer").click(function(){
    $(this).parent().remove();
  });
// Add printers end


  }); // End jquery

} (window.jQuery, window, document));



    