categories = ["Adventure", "Sport", "Visits", "Workshops", "Cultural", "Food"]

# TODO: your code goes here
puts "What activity would you like to add?"
new_activity = gets.chomp

categories = categories << new_activity
categories_sorted = categories.sort

puts "[CATEGORIES OF ACTIVITIES]"
categories_sorted.each do |category|
  puts "-#{category}"
end

number_categories=categories_sorted.count

puts "Total : #{number_categories}"
