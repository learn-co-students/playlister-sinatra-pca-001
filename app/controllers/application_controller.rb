class ApplicationController < Sinatra::Base
  set :views, Proc.new { File.join(root, "../views/") }
  register Sinatra::ActiveRecordExtension
  set :session_secret, "my_application_secret"
  enable :sessions

  get '/' do
    "hey"
  end
end