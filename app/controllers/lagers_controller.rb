class LagersController < ApplicationController
  def show
    @user = User.find(params[:user_id])
    @phase = "lager"
    render :show
  end

  def create
    # user_beer_mash POST   /user/:user_id/beer/:beer_id/mash(.:format)    mashes#create
    @lager = Lager.create(phase_params)
    @beer = @lager.beer
    @beer.update(phase_update)
    if @sparge
      render json: {status: "success"}
      # redirect_to "/user/#{@mash.user_id}/beer/#{@mash.beer_id}/phases"
    else
      render json: {status: "error"}
    end
  end

  private
    def phase_update
      {phaseX: @beer.phaseX + 1}
    end
    def phase_params
      params.require(:lager).permit(:temps, :user_id, :beer_id)
    end
end
