activity = {"name" => "Escape Game" , "category" => "Adventure" , "city" => "Paris" , "duration" => 60 , "number_participants" => 6 , "price" => 120}

# TODO: your code goes here
puts "#{activity["name"]} [#{activity["category"].upcase}]"
puts "Located in #{activity["city"]}"
puts "Duration of #{activity["duration"]} minutes"
puts "For #{activity["number_participants"]} participants"
puts "Charged #{activity["price"]} euros"
