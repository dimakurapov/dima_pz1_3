class MarketsController < ApplicationController
    before_action :authenticate_user!
    load_and_authorize_resource
    
    def index
      @markets = Market.all
    end
  
    def show
      @market = Market.find(params[:id])
    end
  
    def new
      @market = Market.new
    end
  
    def create
      @market = Market.new(market_params)
      @market.user = current_user
      
      if @market.save
        redirect_to @market, notice: 'Запись успешно создана.'
      else
        render :new, status: 422
      end
    end
  
    def edit
      @market = Market.find(params[:id])
    end
  
    def update
      @market = Market.find(params[:id])
      
      if @market.update(market_params)
        redirect_to @market, notice: 'Запись успешно загружена.'
      else
        render :edit
      end
    end
  
    def destroy
      @market = Market.find(params[:id])
      @market.destroy
      
      redirect_to markets_url, notice: 'Запись успешно удалена.'
    end
  
    private
  
    def market_params
      params.require(:market).permit(:title, :picture, :description, :price, :location)
    end
  end