class ReviewsController < ApplicationController
  before_action :authenticate_user!
  respond_to :html, :json, only: :update

  def new
    @beer = Beer.find(params[:beer_id])
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @beer = Beer.find(params[:beer_id])
    @review.beer = @beer
    @review.user = current_user
    if @review.save
      ReviewNotifier.new_review(@review).deliver_later
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
      flash[:notice] = "Your review has been updated!"
      binding.pry
      respond_to do |format|
        format.html { redirect_to beer_path(@beer) }
        format.json { render json: @review }
      end
    else
      flash[:notice] = "Review not updated"
      render :edit
    end
  end

  def destroy
    if current_user.admin?
      @review = Review.find(params[:id])
    else
      @review = current_user.reviews.find(params[:id])
    end

    @beer = @review.beer
    if @review.destroy
      flash[:notice] = "Your review has been deleted!"
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
