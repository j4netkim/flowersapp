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
        @flower = Flower.new(season_name: params[:season_name], price: params[:price])
        @season = Season.find_or_create_by(name: params[:season])
        @flower.season = @season
        @flower.save
        # redirect "flowers/#{@flower.id}
    end
    
    get '/flowers/:id' do
        @flower = Flower.find(params[:id])
        erb :'flowers/show'
    end

    patch 'flowers/:id' do
    
    end
end