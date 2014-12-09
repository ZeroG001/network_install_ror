/*# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
*/
(function($, window, document) {

  //locally scoped variables

  $(function(){

    //For radio buttons on the new form page make the text of the button
    //match the value of the button


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
      $(".sidebar_backdrop").css("display", "inline");
    
      setTimeout(function(){
        $(".sidebar").removeClass("sidebarSlideOut");
      },500); 

     
     } else if (!$(".sidebar").hasClass("hidden-xs") && !$(".sidebar").hasClass("sidebarSlideOut") ) { //&& !$(".sidebar").hasClass("sidebarSlideOut")
      $(".sidebar").addClass("sidebarSlideIn")
      $(".sidebar_backdrop").css("display", "none");
      setTimeout(function(){
        $(".sidebar").addClass("hidden-xs");
        $(".sidebar").removeClass("sidebarSlideIn");
      },500);
     }

    }); // Click function end

//Changes attributes of the input field basted on what you click in the search dropdown box
$dropdown_item = $(".dropdown-menu li");
  $dropdown_item.click(function(){
    if($(this).is("li")){
      $(".search-input").val('');
      $(".dropdown-text").text($(this).text());
      $(".search-input").attr("name", $(this).attr("data-params"));
      $(".search-input").attr("id", $(this).attr("data-params"));
    }
  });

// When you click the add printer button in the form. It will add a new printer field
  var new_printer_input = '<div class="row printer_input">'
       +'<div class="col-lg-5 col-md-5 col-sm-5">'
          +'<div class="input-group">'
            +'<input class="string optional form-control" id="net_form_printer_ip" name="form[printer_ip][]" type="text">'
             +'<span class="input-group-btn">'
               +'<button class="btn btn-default remove_printer" type="button">Remove</button>'
              +'</span>'
            +'</div>'
          +'</div>'
        +'</div>'

$(".add_printer").click(function(){
    if($(".printer_input").length >= 6) {
      alert("You cannot add more than 6 printers.")
      return false;
    }
    $(".printers").append(new_printer_input);

    $(".remove_printer").click(function(){
    printer_input = $(this).parentsUntil($("row , div.printer_input"));
    $(this).closest($("div.printer_input")).remove();
  });

  });

  $(".remove_printer").click(function(){
    printer_input = $(this).parentsUntil($("row , div.printer_input"));
    $(this).closest($(".printer_input")).remove();
  });
// Add printers end


//For updating users when the user clicks on one of the radio buttons make sure that all other radion button are unchecked
//   $('.user-radio-button').change(function() {
//         // When any radio button on the page is selected,
//         // then deselect all other radio buttons.
//         $(this).prop("value", "1");
//         $('.user-radio-button:checked').not(this).prop('checked', false)
//     });
// //user update end


// //AJAX Load more results begin.
// Enable this when you're ready for ajax requests on results.
//just created a button with class .load-more-button
// $(".load-more-button").click(function(){
//   $.ajax({

//       url: "/search"

//   }).done(function( html ) {

//     html = $(html).find(".result_rows");
//     $(".result_rows:last").append( html );

//   }); // done function end

// });// ajax end

  }); // End jquery

} (window.jQuery, window, document));



    