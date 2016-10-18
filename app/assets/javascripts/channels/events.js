// app/assets/javascripts/channels/events.js

App.events = App.cable.subscriptions.create('EventsChannel', {  
  received: function(data) {
    return $('#events').append(this.renderEvent(data));
  },

  renderEvent: function(data) {
    return "<p> <b>" + data.lat + ": </b>" + data.long + "</p>";
  }
});