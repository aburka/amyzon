class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :book_authors, foreign_key: :author_id
  has_many :books, through: :book_authors

  has_many :sales
  has_many :purchased_books, through: :sales, class_name: "Book", foreign_key: :book_id

  validates :name, :email, presence: true
end
