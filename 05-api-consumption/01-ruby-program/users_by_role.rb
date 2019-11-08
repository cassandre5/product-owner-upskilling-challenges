require "json"
require "rest-client"

puts "What is the role of the users you're looking for? (e.g. Figgo - Manager)"
role = gets.chomp # asks user to type something in the Terminal
puts "Ok got it! Let's search for the users..."

# TODO: your code goes here
token = "Lucca application=18afcfb8-697b-4742-b726-418269485cee"

# search role id
url1 = "https://wagon.ilucca-demo.net/api/v3/roles"
params1 = {"name" => "like,#{role}", "fields" => "id"}
response1=RestClient.get(url1, "params" => params1, "Authorization" => token)

payload1=JSON.parse(response1.body)
role_id=payload1["data"]["items"][0]

# search users with this role
url2 = "https://wagon.ilucca-demo.net/api/v3/users"
params2 = {"rolePrincipalId" => "#{role_id["id"]}", "fields" => "firstname,lastname,jobTitle"}
response2=RestClient.get(url2, "params" => params2, "Authorization" => token)

payload2=JSON.parse(response2.body)
users=payload2["data"]["items"]
number=users.count

# display results
puts "Total: #{number} people found"
puts ""
users.each do |user|
  puts "#{user["firstName"]} #{user["lastName"]}"
  puts "#{user["jobTitle"]}"
  puts "---"
end
