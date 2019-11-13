require "sinatra"
require "sinatra/json"
require "sinatra/link_header"
require "sinatra/namespace"
require "sinatra/reloader" if development?

require "sqlite3"

enable :static

DB_PATH = File.join(__dir__, "db/team_building.sqlite")
DB      = SQLite3::Database.new(DB_PATH)
DB.results_as_hash = true

get "/" do
  json "name" => "Team Building API", "status" => "Running"
end

# API v1
namespace "/v1" do

  # list of all activities
  get "/activities" do
    activities = DB.execute("SELECT * FROM activities order by name;")
    json "activities" => activities
  end

  # details of one activity
  get "/activities/:id" do
    activities = DB.execute("SELECT * from activities where id = #{params["id"]};")
    json "activities" => activities
  end

end

# API v2
namespace "/v2" do

  # list of all activities - filters
  get "/activities" do
    if params["city"] !=nil
      activities = DB.execute("SELECT * from activities where city = '#{params["city"]}' order by name;")
      json "activities" => activities
    elsif params["category"] !=nil
      activities = DB.execute("SELECT * from activities where category = '#{params["category"]}' order by name;")
      json "activities" => activities
    elsif params["search"] !=nil
      activities = DB.execute("SELECT * from activities where name like '%#{params["search"]}%' order by name;")
      json "activities" => activities
    else
    activities = DB.execute("SELECT * FROM activities order by name;")
    json "activities" => activities
    end
  end

  # details of one activity
  get "/activities/:id" do
    activities = DB.execute("SELECT * from activities where id = #{params["id"]};")
    json "activities" => activities
  end

  # filter on category
  get "/activities?category=:category" do
    activities = DB.execute("SELECT * from activities where category = '#{params["category"]}'';")
    json "activities" => activities
  end

end

namespace "/doc" do
  get { erb :"doc/index" }

  namespace "/v1" do
    get "/activities" do
      erb :"doc/v1/activities"
    end
  end

  namespace "/v2" do
    get "/activities" do
      erb :"doc/v2/activities"
    end
  end
end
