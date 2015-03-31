class ReviewsController < ApplicationController
  def index
    @reviews = Review.all.limit(10)
  end

  def show
    @review = Review.find(params[:id])
  end

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @beer = Beer.find(params[:id])
    if @review.save
      flash[:notice] = "Review Saved"
      redirect_to beer_show_path(@beer)
    else
      render :new
    end
  end

  def edit
    @review = Review.find(params[:id])
  end

  def update
    @review = Review.find(params[:id])
    @beer = Beer.find(params[:id])
    if @Review.update(review_params)
      flash[:notice] = "Review Updated"
      redirect_to beer_show_path(@beer)
    else
      flash[:notice] = "Review not updated"
      render :edit
    end
  end

  protected
  def review_params
    params.require(:review).permit(:rating, :description, :beer_id)
  end
end
