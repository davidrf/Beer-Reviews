class BreweriesController < ApplicationController
  def index
    @breweries = Brewery.page(params[:page]).per(15).order(:name)
  end

  def show
    @brewery = Brewery.find(params[:id])
    @beers = @brewery.beers.page(params[:page]).per(15)
  end
end
