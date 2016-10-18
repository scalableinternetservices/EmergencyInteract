# app/channels/events_channel.rb

class EventsChannel < ApplicationCable::Channel  
	def subscribed
    	stream_from 'events'
  	end
end