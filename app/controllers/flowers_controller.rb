class FlowersController < ApplicationController
    
    get '/flowers' do
        if logged_in?
            @flowers = current_user.flowers
            erb :'flowers/index'
        else
            redirect '/login'
        end
    end

    get '/flowers/new' do
        if logged_in?
            erb :'flowers/new'
        else
            redirect '/login'
        end
    end
    
    post '/flowers' do
        user = User.find_by(id: params[:season_id])
        flower = current_user.flowers.build(params)
        if flower.save
            redirect "/flowers/#{flower.id}"
        else
            redirect "/flowers/new"
        end
    end

    get '/flowers/:id' do
        if logged_in?
            @flower = current_user.flowers.find_by(id: params[:id])
            if @flower
                erb :'flowers/show'
            else
                redirect '/flowers'
            end
        else
            redirect '/login'
        end
    end

    get '/flowers/:id/edit' do
        if logged_in?
            @flower = current_user.flowers.find_by(id: params[:id])
            if @flower
                erb :'flowers/edit'
            else
                redirect '/flowers'
            end
        else
            redirect 'login'
        end
    end

    patch '/flowers/:id' do
        flower = current_user.flowers.find_by(id: params[:id])
        if flower
            if flower.update(name: params[:name])
                redirect "/flowers/#{flower.id}"
            else
                redirect "/flowers"
            end
        else
            redirect '/flowers'
        end
    end
    

    delete '/flowers/:id' do
        if logged_in?
            @flower = current_user.flowers.find_by(id: params[:id])
            if @flower
                @flower.destroy
            end
            redirect '/flowers'
        else
            redirect '/login'
        end
    end
end