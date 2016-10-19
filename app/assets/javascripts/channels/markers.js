// app/assets/javascripts/channels/markers.js

App.markers = App.cable.subscriptions.create('MarkersChannel', {
	recieved: function(data) {
		console.log(data)
		return $('#markers').append(this.renderMarker(data));
	},

	renderMarker: function(data) {
		return "<p>"+ data.lat + " " + data.long + "</p>"
	}
});

