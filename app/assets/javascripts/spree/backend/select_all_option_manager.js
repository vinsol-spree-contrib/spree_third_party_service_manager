function SelectAllOptionManager(options){
  this.$selectElement = options.$selectElement;
}

SelectAllOptionManager.prototype.init = function(){
  this.$selectElement.on('click', this.manage())
};

SelectAllOptionManager.prototype.manage = function(){
  var _this = this;

  return function(){
    _this.selectOrDeselectAllOptions(this);
    _this.updateSelectOptionText(this);    
  };
};

SelectAllOptionManager.prototype.selectOrDeselectAllOptions = function(selectElement){
  if($(selectElement).find(":selected").first().val() == 'select'){
    if($(selectElement).attr("data-select-all") == "false"){
      $(selectElement).find("option:gt(0)").prop("selected", true);
    }else{
      $(selectElement).find("option").prop("selected", false);
    }
  }
};

SelectAllOptionManager.prototype.updateSelectOptionText = function(selectElement){
  if($(selectElement).find("option:gt(0):selected").length == $(selectElement).find("option:gt(0)").length){
    $(selectElement).attr("data-select-all", "true").find("option:eq(0)").prop("selected", false).text("Remove All").trigger('change');
  }else{
    $(selectElement).attr("data-select-all", "false").find("option:eq(0)").text("Select All").trigger('change');
  }
}

$(function(){
  var servicePagesSelectAllOptionManagerArguments = { $selectElement : $('[data-hook="admin_third_party_service_from_pages"] select') },
      servicePagesSelectAllOptionManager = new SelectAllOptionManager(servicePagesSelectAllOptionManagerArguments);

  servicePagesSelectAllOptionManager.init();
});
