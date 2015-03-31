class ReviewsController < ApplicationController
  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @beer = Beer.find(params[:beer_id])
    if @review.save
      flash[:notice] = "Review Saved"
      redirect_to beer_path(@beer)
    else
      flash[:notice] = "Invalid Input"
      render :new
    end
  end

  def edit
    @review = Review.find(params[:id])
  end

  def update
    @review = Review.find(params[:id])
    @beer = Beer.find(params[:beer_id])
    if @review.update(review_params)
      flash[:notice] = "Review Updated"
      redirect_to beer_path(@beer)
    else
      flash[:notice] = "Review not updated"
      render :edit
    end
  end

  def destroy
    @beer = Beer.find(params[:beer_id])
    @review = Review.find(params[:id])
    if @review.destroy
      flash[:notice] = "Review deleted."
    else
      flash[:notice] = "Review not deleted"
    end
    redirect_to beer_path(@beer)
  end

  protected

  def review_params
    params.require(:review).permit(:rating, :description, :beer_id, :user_id)
  end
end
