class MashesController < ApplicationController
  def show
    @user = User.find(params[:user_id])
    render :show
  end

  def create
    # user_beer_mash POST   /user/:user_id/beer/:beer_id/mash(.:format)    mashes#create
    binding.pry
    @mash = Mash.create()
  end

  private
    def phase_params
      params.permit(:temps, :user_id, :beer_id)
    end
end
