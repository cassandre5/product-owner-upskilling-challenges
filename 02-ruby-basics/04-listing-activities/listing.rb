activities = [
  {"name" => "Escape Game" , "category" => "Adventure" , "city" => "Paris" , "duration" => 60 , "number_participants" => 6 , "price" => 120} ,
  {"name" => "Ping-pong" , "category" => "Sport" , "city" => "Lille" , "duration" => 90 , "number_participants" => 4 , "price" => 80},
  {"name" => "Museum" , "category" => "Visits" , "city" => "Paris" , "duration" => 120 , "number_participants" => 15 , "price" => 150}
]

# TODO: your code goes here
activities.each do |activity|
  puts "#{activity["name"]} [#{activity["category"].upcase}]"
  puts "Located in #{activity["city"]}"
  puts "Duration of #{activity["duration"]} minutes"
  puts "For #{activity["number_participants"]} participants"
  puts "Charged #{activity["price"]} euros"
  puts "---"
end
