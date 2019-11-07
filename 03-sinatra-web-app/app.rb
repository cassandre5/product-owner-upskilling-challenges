require "sinatra"
require "sinatra/link_header"
require "sinatra/reloader" if development?

enable :static

get "/" do
  @activities = [
    {"name" => "Escape Game" , "category" => "Adventure" , "city" => "Brive" , "duration" => 60 , "number_participants" => 6 , "price" => 120 , "photo" => "images/escape.jpg"} ,
    {"name" => "Beach volley" , "category" => "Sport" , "city" => "Marseille" , "duration" => 90 , "number_participants" => 4 , "price" => 60 , "photo" => "images/beach-volley.jpg"},
    {"name" => "Museum" , "category" => "Visits" , "city" => "Paris" , "duration" => 120 , "number_participants" => 15 , "price" => 150 , "photo" => "images/museum.jpg"}
  ]

  erb :index
end

get "/activities/1" do
  @activity = {"name" => "Escape Game" , "category" => "Adventure" , "city" => "Brive" , "duration" => 60 , "number_participants" => 6 , "price" => 120 , "photo" => "/images/escape.jpg"}
  erb :show
end
