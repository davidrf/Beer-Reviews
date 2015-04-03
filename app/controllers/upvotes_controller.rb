class UpvotesController < ApplicationController
  before_action :authenticate_user!
  def create
    @upvote = Upvote.new
    @review = Review.find(params[:review_id])
    @upvote.user = current_user
    @upvote.review = @review

    @review.vote_terminator(current_user)
    @upvote.save

    redirect_to beer_path(@upvote.review.beer)
  end
end
