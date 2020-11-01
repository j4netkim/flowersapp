class UsersController < ApplicationController

    get '/signup' do
        @users = User.all
        erb :'/users/signup'
    end

    post '/signup' do
        user = User.new(params)
        if user.save
            redirect '/flowers'
        else
            redirect '/users/signup'
    end
end