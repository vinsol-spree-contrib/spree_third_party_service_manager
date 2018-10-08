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
      url: _this.getToggleUrl(this),
      type: "PATCH",
      context: this,
      dataype: "json"
    })
      .done(_this.toggleEnabled)
      .fail(function(xhr, status, errorThrown){
        show_flash('error', xhr.responseJSON.error);
      });
  };

};

ThirdPartyServiceToggler.prototype.toggleEnabled = function(response){
  $(this).data("enabled", response.enabled);
  $(this).parents('td[data-hook="admin_third_party_services_index_row_actions"]').prev('.enabled').text(response.enabled);
};

ThirdPartyServiceToggler.prototype.getToggleUrl = function(element){
  if($(element).data('enabled') == "Yes"){
    return "/admin/third_party_services/:id/disable".replace(":id", $(element).data('service-id'))
  }
  else{
    return "/admin/third_party_services/:id/enable".replace(":id", $(element).data('service-id'))
  }
};

$(function(){

  var thirdPartyServiceTogglerArguments = { $toggleSwitches : $("[data-toggle-switch='yes']") },
      thirdPartyServiceToggler = new ThirdPartyServiceToggler(thirdPartyServiceTogglerArguments);

  thirdPartyServiceToggler.init();
});
