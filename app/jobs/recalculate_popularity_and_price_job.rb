class RecalculatePopularityAndPriceJob < ApplicationJob
  queue_as :default

  def perform(book)
    recent_sales = book.sales.where("created_at > ?", 3.days.ago).count
    new_popularity = book.popularity + (book.sales.count * recent_sales)

    tenth_most_popular_book = Book.all.pluck(:popularity).max(10).min

    if new_popularity > tenth_most_popular_book
      new_price = book.price * 1.15
    else
      new_price = book.price - (book.price * 0.15)
    end

    book.update!(price: new_price, popularity: new_popularity)
  end
end
