class DownvotesController < ApplicationController
  before_action :authenticate_user!
  respond_to :html, :json, only: :create

  def create
    @review = Review.find(params[:review_id])
    @review.vote_terminator(current_user)
    @review.reload

    @downvote = Downvote.new
    @downvote.user = current_user
    @downvote.review = @review
    @downvote.save

    respond_to do |format|
      format.html { redirect_to beer_path(@downvote.review.beer) }
      format.json { render json: @downvote.review.upvotes_count }
    end
  end
end
