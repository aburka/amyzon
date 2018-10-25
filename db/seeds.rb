require "faker"

ActiveRecord::Base.transaction do
  User.create!(name: "Amy", email: "amy@amyzon.dev", password: "testing1", admin: true)

  35.times do
    User.create!(name: Faker::Name.name, email: Faker::Internet.email, password: "testing1")
    print "."
  end

  75.times do
    Book.create!(title: Faker::Book.title, price: Faker::Commerce.price,
      author: User.where(admin: false).sample, popularity: Random.new.rand(1..100))
    print "."
  end

  300.times do
    Sale.create!(book: Book.all.sample, user: User.where(admin: false).sample, stripe_charge_id: "ch_123456789")
    print "."
  end
end
