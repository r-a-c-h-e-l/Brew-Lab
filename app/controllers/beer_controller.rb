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
      phaseX: 0
    }
    @beer = Beer.create(beer_params)
    current_beer = {
      beer_id: @beer.id
    }
    @user.update(current_beer)
    render :phases
  end

  def phases
    @beer = Beer.find(params[:beer_id])
    @user = User.find(params[:id])
    @phase_array = JSON.parse(@beer.phase_array)
    # binding.pry
    render :phases
  end

  def show
    # need to make show template that diplays the indv beer all fancy
    @beer = Beer.find(params[:id])
    @user = @beer.user
    render :show
  end

  def update
    @beer = Beer.find(params[:id])
    @beer.update(filter_params)
    path_params = {
      user_id: @beer.user.id,
      id: @beer.id
    }
    redirect_to user_beer_path(path_params)
  end

  def destroy
    @beer = Beer.find(params[:id])
    @beer.destroy
    #/user/:id/beers(.:format)                      beer#index
    redirect_to "/user/#{params[:user_id]}/beers"
  end

  private
    def filter_params
      hash = {}
      params.each do |key, value|
        if key ==="beer_name" || key ==="beer_type" || key ==="bottles" || key ==="beer_notes"
          if value != ""
            hash[key] = value
          end
        end
      end
      params.permit(hash.keys)
    end
end
