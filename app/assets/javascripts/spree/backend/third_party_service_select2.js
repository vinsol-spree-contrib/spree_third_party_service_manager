//resolving focusing issue with the select2's select tag 
$(function(){
  $('select').select2({}).focus(function(){ 
    $(this).select2('focus'); 
  });
});
