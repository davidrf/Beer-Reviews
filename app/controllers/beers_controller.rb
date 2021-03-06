class BeersController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    if params[:query]
      @beers = Beer.page(params[:page]).per(15).search(params[:query])
      flash.now[:notice] = @beers.search_message
    else
      @beers = Beer.page(params[:page]).per(15).order(:name)
    end
  end

  def show
    @beer = Beer.find(params[:id])
    @reviews = @beer.reviews.page(params[:page]).per(15)
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
    if current_user.admin?
      @beer = Beer.find(params[:id])
    else
      @beer = current_user.beers.find(params[:id])
    end
  end

  def update
    if current_user.admin?
      @beer = Beer.find(params[:id])
    else
      @beer = current_user.beers.find(params[:id])
    end

    if @beer.update(beer_params)
      flash[:notice] = "Beer Information Updated"
      redirect_to beer_path(@beer)
    else
      flash[:notice] = "Invalid Beer Submission"
      render :edit
    end
  end

  def destroy
    if current_user.admin?
      @beer = Beer.find(params[:id])
    else
      @beer = current_user.beers.find(params[:id])
    end

    if @beer.destroy
      flash[:notice] = "Beer Successfully Deleted"
    else
      flash[:notice] = "Beer was not deleted"
    end
    redirect_to beers_path
  end

  protected

  def beer_params
    params.require(:beer).permit(
      :name,
      :style_id,
      :brewery_id,
      :abv,
      :ibu,
      :description,
      :image
    )
  end
end
