class UpvotesController < ApplicationController

  def create
    @upvote = Upvote.new
    @review = Review.find(params[:review_id])
    @upvote.user = current_user
    @upvote.review = @review

    @review.has_voted(current_user)
    @upvote.save

    redirect_to beer_path(@upvote.review.beer)
  end
end
