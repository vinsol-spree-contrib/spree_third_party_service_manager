function SelectAllOptionManager(options){
  this.$selectElement = options.$selectElement;
}

SelectAllOptionManager.prototype.init = function(){
  this.$selectElement.on('click', this.manageOptions.bind(this));
};

SelectAllOptionManager.prototype.manageOptions = function(){
  this.selectOrDeselectAllOptions();
  this.updateSelectOptionText();    
};

SelectAllOptionManager.prototype.selectOrDeselectAllOptions = function(){
  if(this.$selectElement.find(":selected").first().val() == 'select') {
    if(this.$selectElement.attr("data-select-all") == "false") {
      this.$selectElement.find("option:gt(0)").prop("selected", true);
    } else {
      this.$selectElement.find("option").prop("selected", false);
    }
  }
};

SelectAllOptionManager.prototype.updateSelectOptionText = function(){
  if(this.$selectElement.find("option:gt(0):selected").length == this.$selectElement.find("option:gt(0)").length) {
    this.$selectElement.attr("data-select-all", "true").find("option:eq(0)").prop("selected", false).text("Remove All").trigger('change');
  } else {
    this.$selectElement.attr("data-select-all", "false").find("option:eq(0)").text("Select All").trigger('change');
  }
}

$(function(){
  var servicePagesSelectAllOptionManagerArguments = { $selectElement : $('[data-hook="admin_third_party_service_from_pages"] select') },
      servicePagesSelectAllOptionManager = new SelectAllOptionManager(servicePagesSelectAllOptionManagerArguments);

  servicePagesSelectAllOptionManager.init();
});
