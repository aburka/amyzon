require "faker"

ActiveRecord::Base.transaction do
  User.create!(name: "Amy", email: "amy@amyzon.dev", password: "testing1", admin: true)

  35.times do
    User.create!(name: Faker::Name.name, email: Faker::Internet.email, password: "testing1")
    print "."
  end

  finn_file = File.new(Rails.root + "public/images/finn.jpg", "r")
  finn_filename = "#{SecureRandom.uuid}_#{File.basename(Rails.root + "public/images/finn.jpg")}"

  bmo_file = File.new(Rails.root + "public/images/bmo.jpg", "r")
  bmo_filename = "#{SecureRandom.uuid}_#{File.basename(Rails.root + "public/images/bmo.jpg")}"

  images = [
    { io: finn_file, filename: finn_filename, content_type: "image/jpeg" },
    { io: bmo_file, filename: bmo_filename, content_type: "image/jpeg" }
  ]
  75.times do
    book = Book.new(title: Faker::Book.title, price: Faker::Commerce.price,
      author: User.where(admin: false).sample, popularity: Random.new.rand(1..100))
    image = images.sample
    image[:io].rewind # for uploading the same file multiple times
    book.cover_image.attach(image)
    book.save!
    print "."
  end

  300.times do
    Sale.create!(book: Book.all.sample, user: User.where(admin: false).sample, stripe_charge_id: "ch_123456789")
    print "."
  end
end
