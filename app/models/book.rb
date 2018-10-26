class Book < ApplicationRecord
  validates :title, presence: true

  belongs_to :author, class_name: "User"

  has_many :sales
  has_many :users, through: :sales

  has_one_attached :cover_image

  def stripe_amount
    (price * 100).to_i
  end
end
