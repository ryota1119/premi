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
          $(this).children('.item-name').children().attr('name','item[' + index + '][item_name]');
          $(this).children('.item-volume').children().attr('name','item[' + index + '][volume]');
          $(this).children('.item-price').children().attr('name','item[' + index + '][price]');
          index += 1;
        });

        $(this).parent().next().find('input[name="item[' + cloneNo2 + '][item_name]"]').val("");
        $(this).parent().next().find('input[name="item[' + cloneNo2 + '][volume]"]').val("");
        $(this).parent().next().find('input[name="item[' + cloneNo2 + '][price]"]').val("");
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
        $(this).children('.item-name').children().attr('name','item[' + index + '][item_name]');
        $(this).children('.item-volume').children().attr('name','item[' + index + '][volume]');
        $(this).children('.item-price').children().attr('name','item[' + index + '][price]');1
        index += 1;
      });
    });
  });
});
