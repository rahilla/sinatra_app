require 'pg'
require 'sinatra'
require 'sinatra/reloader'
require 'pry'

helpers do
  # This helps us run SQL commands
  # Make sure to run the start_ups.sql first as seen below
  # createdb start_ups
  # psql -d start_ups -f start_ups.sql
  def run_sql(sql)
    db = PG.connect(dbname: 'start_ups', host: 'localhost')
    result = db.exec(sql)
    db.close
    result
  end
end

#  Start routing!!
# Example for index.


get '/' do
  sql = "SELECT * FROM start_ups"
  @start_ups = run_sql(sql)
  erb :index
end

# Sends them to a new (create) page
get '/start_ups/new' do
  erb :new
end

# Showing a single start_up by :id!!
get '/start_ups/:id' do
  # Showing a single start_up by the ID number
  id = params[:id]
  sql = "SELECT * FROM start_ups WHERE id=#{id}"
  @start_ups = run_sql(sql).first
  erb :show
end
