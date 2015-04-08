class StylesController < ApplicationController
  def index
    @styles = Style.all.order(:name)
  end

  def show
    @style = Style.find(params[:id])
    @beers = @style.beers.page(params[:page]).per(15)
  end
end
