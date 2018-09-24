function ThirdPartyServiceToggler(options){
  this.$toggleSwitches = options.$toggleSwitches;
}

ThirdPartyServiceToggler.prototype.init = function(){
  this.$toggleSwitches.on('change', this.sendAjaxToUpdateEnabled());
};

ThirdPartyServiceToggler.prototype.sendAjaxToUpdateEnabled = function(){
  var _this = this;

  return function(){
    $.ajax({
      url: $(this).data('toggle-url'),
      type: "POST",
      dataype: "json"
    })
      .done(_this.toggleEnabled)
      .fail(function(xhr, status, errorThrown){
        show_flash('error', xhr.responseJSON.error);
      });
  };

};

ThirdPartyServiceToggler.prototype.toggleEnabled = function(json){
  $(".switch [data-service-id='" + json.id +"']").data('toggle-url', json.toggle_url);
  $(".enabled[data-service-id='" + json.id +"']").text(json.enabled)
};

$(function(){

  var thirdPartyServiceTogglerArguments = { $toggleSwitches : $("[data-toggle-switch='yes']") },
      thirdPartyServiceToggler = new ThirdPartyServiceToggler(thirdPartyServiceTogglerArguments);

  thirdPartyServiceToggler.init();
});
