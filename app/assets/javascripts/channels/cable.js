// app/assets/javascripts/channels/static_pages.js

//= require cable
//= require_self
//= require_tree .

this.App = {};

//App.cable = ActionCable.createConsumer();  

(function() {
  this.App || (this.App = {});

  App.cable = ActionCable.createConsumer("/cable");
}).call(this);