function ThirdPartyServiceToggler(options){
  this.$toggleSwitches = options.$toggleSwitches;
}

ThirdPartyServiceToggler.prototype.init = function(){
  this.$toggleSwitches.on('change', this.updateEnabled());
};

ThirdPartyServiceToggler.prototype.updateEnabled = function(){
  var _this = this;

  return function(){
    $.ajax({
      url: $(this).data('toggle-url'),
      type: "POST",
      dataype: "json"
    })
      .done(_this.toggleEnabled)
      .fail(function(xhr, status, errorThrown){
        _this.showFlash('error', xhr.responseJSON.error);
      });
  };

};

ThirdPartyServiceToggler.prototype.toggleEnabled = function(json){
  $(".switch [data-service-id='" + json.id +"']").data('toggle-url', json.toggle_url);
  $(".enabled[data-service-id='" + json.id +"']").text(json.enabled)
};

ThirdPartyServiceToggler.prototype.showFlash = function(type, message){
  var flash_div = $('.alert-' + type);
  if (flash_div.length == 0) {
    flash_div = $('<div class="alert alert-' + type + '" />');
    $('#content').prepend(flash_div);
  }
  flash_div.html(message).show().delay(10000).slideUp();
};

$(function(){

  var thirdPartyServiceTogglerArguments = { $toggleSwitches : $("[data-toggle-switch='yes']") },
      thirdPartyServiceToggler = new ThirdPartyServiceToggler(thirdPartyServiceTogglerArguments);

  thirdPartyServiceToggler.init();
});
