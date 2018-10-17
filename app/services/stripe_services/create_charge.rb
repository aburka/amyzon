class StripeServices::CreateCharge
  def self.call(book, user, stripe_token)
    Stripe::Charge.create(
      amount: book.stripe_amount,
      currency: "usd",
      source: stripe_token,
      description: "#{user.email} purchased #{book.title}"
    )
  end
end
