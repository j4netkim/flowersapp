require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, 'flowers111'
  end

  get "/" do
    erb :welcome
  end

  # both controllers and view has access to see if someone's loggin
  helpers do
    def logged_in?
      !!session[:user_id]
    end

    def current_user
      @user ||= User.find_by(id: session[:user_id]) if logged_in?
    end
  end
end
