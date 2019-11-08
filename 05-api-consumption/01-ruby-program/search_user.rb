require "json"
require "rest-client"

puts "What is the name of the user you're looking for? (e.g. Bob Dylan)"
name = gets.chomp # asks user to type something in the Terminal

puts "Ok got it! Let's search for that person..."


# TODO: your code goes here
url = "https://wagon.ilucca-demo.net/api/v3/users"
token = "Lucca application=18afcfb8-697b-4742-b726-418269485cee"
params = {"name" => "like,#{name}", "fields" => "firstname,lastname,jobTitle,mail,department[id,name]"}
response=RestClient.get(url, "params" => params, "Authorization" => token)

payload=JSON.parse(response.body)
user=payload["data"]["items"][0]

# puts response.code
# p user
puts "#{user["firstName"]} #{user["lastName"]} (#{user["mail"]})"
puts "#{user["jobTitle"]}"
puts "From department #{user["department"]["name"]}"
