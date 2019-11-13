require "json"
require "rest-client"

require "sinatra"
require "sinatra/link_header"
require "sinatra/reloader" if development?

enable :static

# -----------------------retrieve all the activities from the API----------------
get "/" do

  location=params["location"]

  url1 = "https://team-building-api.cleverapps.io/v2/activities"
  params1 = {"city" => "#{location}", "fields" => "id,name,category,city,duration,participants_count,price,photo_url"}
  response1=RestClient.get(url1, "params" => params1)

  payload1=JSON.parse(response1.body)
  ACTIVITIES=payload1["activities"]

  @activities = ACTIVITIES

  erb :index
end

#---------------------one activity-----------------
get "/activities/:id" do
  p params

  url1 = "https://team-building-api.cleverapps.io/v2/activities"
  params1 = {"fields" => "id,name,category,city,duration,participants_count,price,photo_url"}
  response1=RestClient.get(url1, "params" => params1)

  payload1=JSON.parse(response1.body)
  ACTIVITIES=payload1["activities"]

#id=0
  #activities.each_with_index do |activity,index|
    #if activity["id"]==params["id"].to_i
      #id=index
    #end
  #end
  @activity=ACTIVITIES.find{|activity| activity["id"]==params["id"].to_i}

  erb :show
end
