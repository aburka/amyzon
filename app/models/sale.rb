class Sale < ApplicationRecord
  belongs_to :user
  belongs_to :book

  attr_reader :stripe_token

  after_create :recalculate_book_popularity_and_price

private

  def recalculate_book_popularity_and_price
    RecalculatePopularityAndPriceJob.perform_later(book)
  end
end
