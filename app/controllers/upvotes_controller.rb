class UpvotesController < ApplicationController
  before_action :authenticate_user!
  respond_to :html, :json, only: :create

  def create
    @review = Review.find(params[:review_id])
    @review.vote_terminator(current_user)
    @review.reload

    @upvote = Upvote.new
    @upvote.user = current_user
    @upvote.review = @review
    @upvote.save

    respond_to do |format|
      format.html { redirect_to beer_path(@upvote.review.beer) }
      format.json { render json: @upvote.review.upvotes_count }
    end
  end
end
