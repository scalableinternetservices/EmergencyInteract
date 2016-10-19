#app/channels/markers_channel.rb

class MarkersChannel < ApplicationCable::Channel
	def subscribed
		stream_from 'markers'
	end
end