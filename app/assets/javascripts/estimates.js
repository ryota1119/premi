$(document).on('turbolinks:load', function() {
  $(function() {
    $(".item-add-js-btn").on('click', function() {
      var inputLength = $('input[name="estimate_form[item_name]"]').length;
      if (inputLength < 10) {
        $(this).parent().clone(true).insertAfter($(this).parent());
        $(this).parent().next().find('input[name="estimate_form[item_name]"]').val("");
        $(this).parent().next().find('input[name="estimate_form[volume]"]').val("");
        $(this).parent().next().find('input[name="estimate_form[price]"]').val("");
      }
    });
  
    $(".item-delete-js-btn").click(function() {
      var inputLength = $('input[name="estimate_form[item_name]"]').length;
      if (inputLength >= 2) {
        $(this).parent().remove();
      }
    });
  });
});
