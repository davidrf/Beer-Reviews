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
    if @review.save
      flash[:notice] = "Review Saved"
      redirect_to beer_show_path
    else
      render :new
    end
  end

  def edit
    @gym = Gym.find(params[:id])
  end

  def update
    @gym = Gym.find(params[:id])

    if @gym.update(gym_params)
      flash[:notice] = "Gym Updated"
      redirect_to gyms_path
    else
      flash[:notice] = "Gym not updated"
      render :edit
    end
  end

  protected
  def review_params
    params.require(:gym).permit(:name, :street, :state, :zipcode,
      :founding_date, :phone_number)
  end
end
