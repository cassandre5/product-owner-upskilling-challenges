require "sinatra"
require "sinatra/link_header"
require "sinatra/reloader" if development?

enable :static

get "/" do
  @activities = [
    {"name" => "Escape Game" , "category" => "Adventure" , "city" => "Paris" , "duration" => 60 , "number_participants" => 6 , "price" => 120 , "photo" => "images/escape.jpg"} ,
    {"name" => "Ping-pong" , "category" => "Sport" , "city" => "Lille" , "duration" => 90 , "number_participants" => 4 , "price" => 80 , "photo" => "images/ping-pong.jpg"},
    {"name" => "Museum" , "category" => "Visits" , "city" => "Paris" , "duration" => 120 , "number_participants" => 15 , "price" => 150 , "photo" => "images/museum.jpg"}
  ]

  erb :index
end
