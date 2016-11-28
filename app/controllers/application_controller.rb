class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  options = { :expires_in => 1.day, :compress => true }
  cache = Dalli::Client.new('emergency-cache1.dgkfha.cfg.usw2.cache.amazonaws.com:11211', options)
end
