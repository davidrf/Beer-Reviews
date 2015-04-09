module ReviewHelper
  def review_score(review)
    review.upvotes_count - review.downvotes_count
  end
end
