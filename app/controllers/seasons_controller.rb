class SeasonsController < ApplicationController

    get '/seasons' do
        @seasons = Season.all
        erb :'/seasons/index'
    end
end