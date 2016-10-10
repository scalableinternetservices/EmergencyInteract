json.extract! event, :id, :title, :description, :location, :followers, :interactions, :created_at, :updated_at
json.url event_url(event, format: :json)