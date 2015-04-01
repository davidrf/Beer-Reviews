class ReviewsController < ApplicationController
  before_action :authenticate_user!

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @beer = Beer.find(params[:beer_id])
    @review.beer = @beer
    @review.user = current_user
    if @review.save
      flash[:notice] = "Review Saved"
      redirect_to beer_path(@beer)
    else
      flash[:notice] = "Invalid Input"
      render :new
    end
  end

  def edit
    @review = current_user.reviews.find(params[:id])
  end


  def update
    @review = current_user.reviews.find(params[:id])
    @beer = @review.beer
    if @review.update(review_params)
      flash[:notice] = "Review Updated"
      redirect_to beer_path(@beer)
    else
      flash[:notice] = "Review not updated"
      render :edit
    end
  end

  def destroy
    @review = current_user.reviews.find(params[:id])
    @beer = @review.beer
    if @review.destroy
      flash[:notice] = "Review deleted"
    else
      flash[:notice] = "Review not deleted"
    end
    redirect_to beer_path(@beer)
  end

  protected

  def review_params
    params.require(:review).permit(:rating, :description)
  end
end
