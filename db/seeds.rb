users = []
subscriptions = []
events = []
comments = []

Subscription.destroy_all
User.destroy_all
Comment.destroy_all
Event.destroy_all

CITIESMAP = JSON.parse(File.read('public/cities.json'))

pw = User.new(:password => "qwerty").encrypted_password


1000.times do |n|
	users << "(#{n}, '#{n}@test.com', '#{pw}', '2016-11-23 20:21:13', '2016-11-23 20:21:13')"
	if n%2 == 0
		subscriptions << "('New York', #{n}, '2016-11-23 20:21:13', '2016-11-23 20:21:13')"
	else
		subscriptions << "('Los Angeles', #{n}, '2016-11-23 20:21:13', '2016-11-23 20:21:13')"
	end
end

1000.times do |n|
	if n%3 == 0
		events << "('Title #{n}', 'Description #{n}', 'Los Angeles', '2016-11-23 20:21:13', '2016-11-23 20:21:13', 34.0522342, -118.2436849)"
		if n%2 == 0
			500.times do |k|
				comments << "('Body #{k} 1', #{n}, '2016-11-23 20:21:13', '2016-11-23 20:21:13')"
			end
		end
	else
		events << "('Title #{n}', 'Description #{n}', 'New York', '2016-11-23 20:21:13', '2016-11-23 20:21:13', 41.8781136, -87.6297982)"
		if n%2 == 0
			500.times do |k|
				comments << "('Body #{k} 1', #{n}, '2016-11-23 20:21:13', '2016-11-23 20:21:13')"
			end
		end
	end
end


User.transaction do
	User.connection.execute "INSERT INTO users (id, email, encrypted_password, created_at, updated_at) VALUES #{users.join(', ')}"
	puts "added #{users.count} users to database"
end

Subscription.transaction do
	Subscription.connection.execute "INSERT INTO subscriptions (city, user_id, created_at, updated_at) VALUES #{subscriptions.join(', ')}"
	puts "added #{subscriptions.count} subscriptions to database"
end

Event.transaction do
	Event.connection.execute "INSERT INTO events (title, description, location, created_at, updated_at, lat, long) VALUES #{events.join(', ')}"
	puts "added #{events.count} events to database"
end

Comment.transaction do
	Comment.connection.execute "INSERT INTO comments (body, event_id, created_at, updated_at) VALUES #{comments.join(', ')}"
	puts "added #{comments.count} comments to database"
end

