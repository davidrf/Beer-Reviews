class DownvotesController < ApplicationController
  before_action :authenticate_user!
  def create
    @downvote = Downvote.new
    @review = Review.find(params[:review_id])
    @downvote.user = current_user
    @downvote.review = @review

    @review.vote_terminator(current_user)
    @downvote.save

    redirect_to beer_path(@downvote.review.beer)
  end
end
