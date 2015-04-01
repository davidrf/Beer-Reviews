class BeersController < ApplicationController
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
    @beer.user_id = current_user.id
    if @beer.save
      flash[:notice] = "Beer was saved"
      redirect_to beers_path
    else
      flash[:notice] = "Beer not added"
      render :new
    end
  end

  def edit
    @beer = Beer.find(params[:id])
  end

  def update
    @beer = Beer.find(params[:id])
    if @beer.update(beer_params)
      flash[:notice] = "Beer updated"
      redirect_to beers_path(@beer)
    else
      flash[:notice] = "Beer was not updated"
      render :edit
    end
  end

  def destroy
    @beer = Beer.find(params[:id])
    if @beer.destroy
      flash[:notice] = "Beer deleted"
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
