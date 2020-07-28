require "sinatra"
require "sinatra/base"
require "sinatra/config_file"
require "sinatra/reloader"
require "sinatra/activerecord"
require "json"

class App < Sinatra::Application
  register Sinatra::ConfigFile
  register Sinatra::Reloader

  config_file "config.yml"

  puts settings.foo

  get '/' do
    haml :index, locals: { data: @data }
  end
end
