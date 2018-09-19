function ThirdPartyServiceToggler(options){
  this.$toggleSwitches = options.$toggleSwitches;
}

ThirdPartyServiceToggler.prototype.init = function(){
  this.$toggleSwitches.on('change', this.toggle_service);
};

ThirdPartyServiceToggler.prototype.toggle_service = function(){
  $.ajax({
    url: $(this).data('toggle-url'),
    type: "POST"
  })
    .done(function(json){
      $(".switch [data-service-id='" + json.id +"']").data('toggle-url', json.toggle_url);
      $(".enabled[data-service-id='" + json.id +"']").text(json.enabled)
    })
    .fail(function(xhr, status, errorThrown){
      console.log("Error: " + errorThrown);
      console.log("Status: " + status);
      console.dir(xhr);
    });
};


$(function(){

  var thirdPartyServiceTogglerArguments = { $toggleSwitches : $("[data-toggle-switch='yes']") },
      thirdPartyServiceToggler = new ThirdPartyServiceToggler(thirdPartyServiceTogglerArguments);

  thirdPartyServiceToggler.init();
});
