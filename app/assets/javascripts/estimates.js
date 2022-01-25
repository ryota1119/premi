$(document).on('turbolinks:load', function() {
  $(function() {
    $(".item-add-js-btn").on('click', function() {
      var cloneCode = $(this).parent().clone(true);
      var cloneNo = cloneCode.attr('data-formno');
      var cloneNo2 = parseInt(cloneNo) + 1;
      
      var inputLength = $('input[type="text"]').length;
      if (inputLength < 34) {
        cloneCode.insertAfter($(this).parent());

        var index = 0;
        $('.form-estimate__content__left__input__add').each(function(){
          $(this).attr('data-formno',index);
          $(this).children('.item-name').children().attr('name','estimate_form[items][' + index + '][item_name]');
          $(this).children('.item-volume').children().attr('name','estimate_form[items][' + index + '][volume]');
          $(this).children('.item-price').children().attr('name','estimate_form[items][' + index + '][price]');
          index += 1;
        });

        $(this).parent().next().find('input[name="estimate_form[items][' + cloneNo2 + '][item_name]"]').val("");
        $(this).parent().next().find('input[name="estimate_form[items][' + cloneNo2 + '][volume]"]').val("");
        $(this).parent().next().find('input[name="estimate_form[items][' + cloneNo2 + '][price]"]').val("");
      }
      
    });
  
    $(".item-delete-js-btn").click(function() {
      var inputLength = $('input[type="text"]').length;
      if (inputLength >= 10) {
        $(this).parent().remove();
      }
      var index = 0;
      $('.form-estimate__content__left__input__add').each(function(){
        $(this).attr('data-formno',index);
        $(this).children('.item-name').children().attr('name','estimate_form[items][' + index + '][item_name]');
        $(this).children('.item-volume').children().attr('name','estimate_form[items][' + index + '][volume]');
        $(this).children('.item-price').children().attr('name','estimate_form[items][' + index + '][price]');1
        index += 1;
      });
    });
  });
});
