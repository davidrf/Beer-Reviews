class ReviewNotifier < ApplicationMailer
  default from: "reviews@example.com"

  def new_review(review)
    @review = review

    mail(
      to: review.product.user.email,
      subject: "New Review for #{review.product.name}")
  end
end
