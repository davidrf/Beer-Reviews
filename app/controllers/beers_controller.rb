class BeersController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @beers = Beer.page(params[:page]).order(:name)
  end

  def show
    @beer = Beer.find(params[:id])
  end

  def new
    @beer = Beer.new
  end

  def create
    @beer = Beer.new(beer_params)
    @beer.user = current_user
    if @beer.save
      flash[:notice] = "Beer was saved"
      redirect_to @beer
    else
      flash[:notice] = "Beer not added"
      render :new
    end
  end

  def edit
    @beer = current_user.beers.find(params[:id])
  end

  def update
    @beer = current_user.beers.find(params[:id])
    if @beer.update(beer_params)
      flash[:notice] = "Beer Information Updated"
      redirect_to beer_path(@beer)
    else
      flash[:notice] = "Invalid Beer Submission"
      render :edit
    end
  end

  def destroy
    @beer = current_user.beers.find(params[:id])
    if @beer.destroy
      flash[:notice] = "Beer Successfully Deleted"
    else
      flash[:notice] = "Beer was not deleted"
    end
    redirect_to beers_path
  end

  protected

  def beer_params
    params.require(:beer).permit(:name, :style_id, :abv, :ibu, :description)
  end
end
