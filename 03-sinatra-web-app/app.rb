require "sinatra"
require "sinatra/link_header"
require "sinatra/reloader" if development?

enable :static

get "/" do
  @activities = [
    {"id" => 1 , "name" => "Escape Game" , "category" => "Adventure" , "city" => "Brive" , "duration" => 60 , "number_participants" => 6 , "price" => 120 , "photo" => "/images/escape.jpg"} ,
    {"id" => 2 , "name" => "Beach volley" , "category" => "Sport" , "city" => "Marseille" , "duration" => 90 , "number_participants" => 4 , "price" => 60 , "photo" => "/images/beach-volley.jpg"},
    {"id" => 3 , "name" => "Museum" , "category" => "Visits" , "city" => "Paris" , "duration" => 120 , "number_participants" => 15 , "price" => 150 , "photo" => "/images/museum.jpg"}
  ]

  erb :index
end

get "/activities/:id" do
  p params
  activities = [
    {"id" => 1 , "name" => "Escape Game" , "category" => "Adventure" , "city" => "Brive" , "duration" => 60 , "number_participants" => 6 , "price" => 120 , "photo" => "/images/escape.jpg"} ,
    {"id" => 2 , "name" => "Beach volley" , "category" => "Sport" , "city" => "Marseille" , "duration" => 90 , "number_participants" => 4 , "price" => 60 , "photo" => "/images/beach-volley.jpg"},
    {"id" => 3 , "name" => "Museum" , "category" => "Visits" , "city" => "Paris" , "duration" => 120 , "number_participants" => 15 , "price" => 150 , "photo" => "/images/museum.jpg"}
  ]
id=0
  activities.each_with_index do |activity,index|
    if activity["id"]==params["id"].to_i
      id=index
    end
  end
puts id
  @activity = activities[id]
  erb :show
end
