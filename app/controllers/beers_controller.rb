class BeersController < ApplicationController
  def index
    @user = User.find(params[:id])
    render :index
  end

  def new
    @beer = Beer.new
    @user = User.find(params[:user_id])
  end

  def create
    @user = User.find(params[:user_id])

    @phase_array = []
    params.each do |key,value|
      if value == "true"
        @phase_array << key
      end
    end
    @length = @phase_array.length
    @strArray = @phase_array.to_json
    beer_params = {
      user_id: @user.id,
      phase_array: @strArray,
      total_phases: @length
    }
    @beer = Beer.create(beer_params)
    current_beer = {
      beer_id: @beer.id
    }
    @user.update(current_beer)
    render :show
  end
end
