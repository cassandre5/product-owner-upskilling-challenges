puts "What is your name?"
name = gets.chomp # asks user to type something in the Terminal

# TODO: your code goes here
puts "What is your year of birth?"
birth_year=gets.chomp.to_i
age=2019-birth_year

puts "Hey #{name}! You are #{age} years old."
