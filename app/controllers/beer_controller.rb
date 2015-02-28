class BeerController < ApplicationController
  def index
    @user = User.find(params[:id])
    render :index
  end

  def new
    @beer = Beer.new
    @user = User.find(params[:user_id])
    render :new
  end

  def create
    @user = User.find(params[:user_id])
    @phase_array = []
    # grab users selected phases
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
      total_phases: @length,
      phaseX: 1
    }
    @beer = Beer.create(beer_params)
    current_beer = {
      beer_id: @beer.id
    }
    @user.update(current_beer)
    render :phases
  end

  def phases
    @user = User.find(params[:id])
    @phase_array = JSON.parse(@user.beer.phase_array)
    # binding.pry
    render :phases
  end

  def show
    # need to make show template that diplays the indv beer all fancy!
    @beer = Beer.find()
    render :show
  end
end
