/*# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
*/


var new_printer_input = '<div class="new_printer"><input class="printer_input string optional" id="net_form_printer_ip" name="net_form[printer_ip][]" type="text"><span class="remove_printer"><div class="btn">-</div></span></div>'

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

  $(".search-search").click(function(){
    $.ajax({
      url: '/search'
    }).done(function( html ){
      $(".main-form").empty();
      $(".main-form").append( html );
    });
  });
    