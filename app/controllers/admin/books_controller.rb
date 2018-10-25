class Admin::BooksController < AdminController
  def index
    @books = Book.includes(:author, :sales).all
  end
end
