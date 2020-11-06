class UsersController < ApplicationController

    get '/signup' do
        # @users = User.all
        erb :'/users/signup'
    end

    post '/signup' do
        user = User.new(params)
        if user.save
            session[:user_id] = @user.id
            redirect '/flowers'
        else
            redirect '/signup'
        end
    end
end