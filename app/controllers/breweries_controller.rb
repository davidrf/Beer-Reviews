class BreweriesController < ApplicationController
  before_action :authenticate_user!

  def show
    @brewery = Brewery.find(params[:id])
  end

  def brewery_params
    params.require(:brewery).permit(:name, :city, :country, :description)
  end
end
