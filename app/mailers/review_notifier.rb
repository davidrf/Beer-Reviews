class ReviewNotifier < ApplicationMailer
  default from: "reviews@example.com"

  def new_review(review)
    @review = review

    mail(
      to: review.beer.user.email,
      subject: "New Review for #{review.beer.name}")
  end
end
