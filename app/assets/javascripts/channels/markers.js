// app/assets/javascripts/channels/markers.js

App.markers = App.cable.subscriptions.create('MarkersChannel', {
	recieved: function(data) {
		console.log(data);
		$('markers').append("hello");
	},

	renderMarker: function(data) {
		return "<p>"+ data.lat + " " + data.long + "</p>"
	}
});

