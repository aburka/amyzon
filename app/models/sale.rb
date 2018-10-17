class Sale < ApplicationRecord
  belongs_to :user
  belongs_to :book

  attr_reader :stripe_token
end
