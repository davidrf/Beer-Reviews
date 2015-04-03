class DownvotesController < ApplicationController

  def create
    @downvote = Downvote.new
    @review = Review.find(params[:review_id])
    @downvote.user = current_user
    @downvote.review = @review

    @review.has_voted(current_user)
    @downvote.save

    redirect_to beer_path(@downvote.review.beer)
  end
end
