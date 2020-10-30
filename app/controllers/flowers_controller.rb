class FlowersController < ApplicationController
    
    get '/flowers' do
        @flowers = Flower.all
        erb :'flowers/index'
    end

    get '/flowers/new' do
        @seasons = Season.all
        erb :'flowers/new'
    end
    
    post '/flowers' do
        season = Season.find_by(id: params[:season_id])
        flower = season.flower.build(params)
        if flower.save
            redirect "/flowers/#{flower.id}"
        else
            redirect "/flowers/new"
        end
    end
    
    get '/flowers/:id' do
        @flower = Flower.find_by(id: params[:id])
        if @flower
            erb :'flowers/show'
        else
            redirect '/flowers'
        end
    end

    patch 'flowers/:id' do
    
    end
end