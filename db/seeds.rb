 require 'faker'

privacy = ["public", "private"] # also group
status = ["done", "todo"]

categories = ["restaurants", "dates", "friends", "things_to_buy", "things_to_do", "before_i_die", "places_to_visit", "activities"]

hashtags = { "restaurants" => ["cheap eats", "casual", "fine dining", "italian", "korean", "chinese", "thai", "asian", "delicious", "noms"],
						"dates" => ["boyfriend", "girlfriend", "adventures", "love", "valentine", "romantic", "fun", "beautiful", "weekend trip", "weekend"],
						"friends" => ["friends", "activities", "weekend", "adventures", "best friends", "weekend trip", "fun", "out of state", "group activities", "group"],
						"things_to_buy" => ["gift for myself", "gift list", "necessities", "want", "give it to me", "want", "need", "gift", "gimme", "please"],
						"things_to_do" => ["urgent", "important", "today", "tomorrow", "weekend", "chores", "to do", "mama said so", "routine"],
						"before_i_die" => ["bucket", "life goals", "wishes", "before i die", "dreams come true"],
						"places_to_visit" => ["asia", "europe", "latin america", "south america", "north america", "africa", "beach", "city", "rural", "suburbs"],
						"activities" => ["free", "expensive", "close by", "casual", "solo", "with friends", "fun"]
						}

bucket_titles = { "restaurants" => ["Places to Eat", "Restaurants", "Nomnoms", "Must Eat Here", "Delicious Places to Eat", "My Favorite Restaurants", "FOOD", "Get In My Belleh", "Eat Me", "Eat"],
						"dates" => ["Places with my Boo", "Date Night", "Dates", "Things to Do With My Boyfriend", "Couple", "<3", "BooThang", "Dates With My Baby", "Love In The Air", "Places With Mr. Lover"],
						"friends" => ["Things to Do With Friends", "Friends", "Best Friends", "Best Friend Bucket List", "Fantastic Friends", "Sisterhood of the Traveling Bucket", "Bromance"],
						"things_to_buy" => ["Things I Need", "Things To Buy", "Wish List", "Buy Me This", "Want List", "Presents For Me", "Presents", "Someone Buy Me This", "Give It To Me", "If I Had More Money", "When I Get A Job, I Will Buy..."],
						"things_to_do" => ["Things To Do", "Do This", "To Do", "Need To Be Done", "Ain't Nobody Got Time Fo Dat", "Do This Before Anything", "Get This Shit Done", "Do This Or Mom Will Kill You"],
						"before_i_die" => ["Actual Bucket List", "Things To Do Before I Die", "Before I Die", "Life Goals", "Kick The Bucket", "You Only Live Once", "YOLO"],
						"places_to_visit" => ["Must Go Here", "Places To Visit", "I Need To Go Here", "Can Someone Take Me Here?", "Who Wants to Go Here With Me?", "I Love These Places"],
						"activities" => ["Things To Do For Fun", "Activities", "Fun Things", "Lets Do This", "There Are So Many Things To Do In This World", "PLAY TIME", "WOOHOO"]}

items = { "restaurants" => ["Cappricios", "Kit's Thai Kitchen", "Wolfgang Pucks", "Cotto", "Kum Kang San", "Panda Garden", "Michael Jordan Steak House", "Lucky's", "Sound of the Whale", "Dinosaur BBQ", "Sanford's", "Ulysses", "Luke's Lobster", "Sushi X", "August", "Isola", "Coalhouse Pizza", "Zaza's", "Fiesta Peruvian Cuisine", "Joe Shanghai", "Luigis", "Shake Shack", "In n Out", "Beer Garden", "Sushi Nakazawa", "Casabel Taqueria", "Ricky's Tacos", "Gemma", "Mok Bar", "Totto Ramen", "Ippudo", "M Wells"],
						"dates" => ["Sunflower Maze", "Apple Picking", "Museum of Modern Art", "Bed and Breakfast in Catskills", "Six Flags", "New Haven Glass House", "Hiking", "Greenwich Point Park", "Tod's Point", "Brownstone Park", "New Croton Dam", "Central Park", "Picnic", "Cove Island Park", "Fishing", "Tree Top Adventure", "Snowboarding", "Mt. Killington", "Cook off", "Pizza Night", "Movie Night", "Museums", "Casino", "Wine Tasting", "Spa", "Couple Massages"],
						"friends" => ["Six Flags", "Ann Arbor Food Festival", "Food Truck Hunting", "Hiking", "Fishing", "Apple Picking", "Electric Daisy Carnival", "Cape Cod", "Atlantic City", "Michigan Football Game", "Oktober Fest", "Bear Mountain", "Runyon Canyon Park", "Central Park", "Underground Rave", "Brooklyn Boulders", "Brooklyn Bowl", "Output", "Coney Island", "Paint Night", "Wine Night", "Sleepover", "Pillow Fight", "Paint Nails", "Potluck", "Cook off"],
						"things_to_buy" => ["Guitar", "New iPhone", "iPad", "TV", "Speakers", "Headphones", "Handbag", "Backpack", "Shoes", "Wallet", "Keurig Machine", "Magic Bullet", "Ice Cream Maker", "Make Up Bag", "Perfume", "Polaroid", "Digital Camera", "Hair Straightener", "Curling Iron", "Toaster", "A Good Book", "Ukelele", "Soda Maker", "Jordans", "MacBook", "Full Body Massage", "Jewelry", "Sunglasses", "Watch"],
						"things_to_do" => ["Laundry", "Wash Dishes", "Study", "Do Homework", "Walk the Dog", "Clean Room", "Mail Letters", "Finish App", "Make a Playlist", "Get a Hair Cut", "Watch Game of Thrones", "Schedule Appointments", "Pay for Bills", "Groceries", "Paint Nails", "Return clothes at the Mall", "Call Mom", "Schedule Meeting", "Sweep the Floor", "Vacuum", "Get a Car Wash", "Call Sister", "Go to Yoga", "Shower", "Email coworkers", "Buy present for mom", "Think of Pitch ideas", "Make a bucket list", "Finish the book", "Pick up brother from airport", "Buy socks"],
						"before_i_die" => ["Skydiving", "Learn How To Play Guitar", "Learn How To Speak Korean", "Learn How To Speak Spanish", "Go To Every Continent", "Eat a Live Octopus", "Catch a Fish", "Pet a Tiger", "Own a Pet Tiger", "Do a split", "Run a Marathon", "Find my soulmate", "Drive across the country", "Go to a strip club", "Open a restaurant", "Get another tattoo", "Do a handstand", "Create a Mobile App", "Own my own company", "Learn to Surf", "Marry a hawaiian", "Live in a rural area", "Own my own house", "Have a baby", "Adopt a child", "Write a novel"],
						"places_to_visit" => ["Paris", "Barcelona", "Ibiza", "Catskills", "Capetown", "Thailand", "Seoul", "Tokyo", "Shanghai", "Hong Kong", "Beijing", "Australia", "New Zealand", "Ethiopia", "London", "Las Vegas", "Miami", "Toronto", "Mt. Killington", "Vadhoo Island", "Hawaii", "San Francisco", "Mexico City", "Cancun", "Playa del Carmen", "Brazil", "Peru", "Machu Pichu", "Belize", "Panama", "Dominican Republic", "Jamaica", "Puerto Rico", "Ireland", "Germany", "Berlin", "Amsterdam", "New York City", "Ann Arbor", "Chicago", "Madrid", "Rome", "Venice", "Florence"],
						"activities" => ["Six Flags", "Yoga", "Sunflower Maze", "Corn Maze", "Haunted House", "Museums", "Picnic", "Park", "Food Festival", "Dance Class", "Clubbing", "Golf Range", "Softball", "Basketball", "Food Truck Hopping", "Play XBox", "Shopping", "Hiking", "Wine Tasting", "Walk around", "Play frisbee", "Go to a festival", "Fishing", "Watch movies", "Read a book", "Go to the movies", "Bowling", "Paint night", "Mini Golfing", "Arcade", "Town Fair", "Jogging", "Work out", "Exercise", "Go to the Gym", "Snowboarding", "Game night", "Cook off", "Drive endlessly"]}

items_with_locations = ["restaurants", "dates", "friends"]

hashtags.values.flatten.each do |value|
	Hashtag.find_or_create_by(tag: value)
end

30.times do |index|
	user_location = Faker::Address.city + ", " + Faker::Address.state_abbr
	user = User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email, phone_number: Faker::PhoneNumber.phone_number, password: "password", location: user_location, picture: "people/marko_kovacevic-dbc_headshots-2014-05-28-square-#{index}.jpg")
	user.update(username: "#{user.first_name.downcase}_#{user.last_name.downcase}")

	rand(1..8).times do
		category = categories.sample
		bucket = user.created_buckets.create(name: bucket_titles[category].sample, privacy: privacy.sample)		
		(0..3).to_a.sample.times do 
			tag = Hashtag.find_by(tag: hashtags[category].sample)
			bucket.bucket_hashtags.find_or_create_by(hashtag_id: tag.id)
		end

		if category == "activites" || category == "friends"
			rand(3..8).times do
				bucket.bucket_ownerships.find_or_create_by(user_id: rand(1..31))
				bucket.privacy = "group" if bucket.bucket_ownerships.length > 1
				bucket.save
			end
		end

		if category == "dates"
				bucket.bucket_ownerships.find_or_create_by(user_id: rand(1..31))
				bucket.privacy = "group" if bucket.bucket_ownerships.length > 1
				bucket.save
		end

		10.times do
			location = Faker::Address.city + ", " + Faker::Address.state_abbr
			item = bucket.items.find_or_create_by(name: items[category].sample)
			item.update(status: status.sample)
			item.location = location if items_with_locations.include?(category)
			item.save
			if bucket.privacy == "group"
				rand(0..bucket.bucket_ownerships.length).times do
					item.attendances.find_or_create_by(user_id: bucket.bucket_ownerships.sample.user_id)
				end
			end
		end
	end
end


## seed for my own purposes
user = User.create(first_name: "Stella", last_name: "Kim", email: "stella@stella.com", username: "stella_kim", phone_number: "555.555.5555", password: "password", location: "Stamford, CT", picture: "nyan-cat.gif")

10.times do
		category = categories.sample
		bucket = user.created_buckets.create(name: bucket_titles[category].sample, privacy: privacy.sample)		
		(0..3).to_a.sample.times do 
			tag = Hashtag.find_by(tag: hashtags[category].sample)
			bucket.bucket_hashtags.find_or_create_by(hashtag_id: tag.id)
		end

		if category == "activites" || category == "friends"
			rand(3..8).times do
				bucket.bucket_ownerships.find_or_create_by(user_id: rand(1..31))
				bucket.privacy = "group" if bucket.bucket_ownerships.length > 1
				bucket.save
			end
		end

		if category == "dates"
				bucket.bucket_ownerships.find_or_create_by(user_id: rand(1..31))
				bucket.privacy = "group" if bucket.bucket_ownerships.length > 1
				bucket.save
		end

		10.times do
			location = Faker::Address.city + ", " + Faker::Address.state_abbr
			item = bucket.items.find_or_create_by(name: items[category].sample)
			item.update(status: status.sample)
			item.location = location if items_with_locations.include?(category)
			item.save
			if bucket.privacy == "group"
				rand(0..bucket.bucket_ownerships.length).times do
					item.attendances.find_or_create_by(user_id: bucket.bucket_ownerships.sample.user_id)
				end
			end
		end
	end
