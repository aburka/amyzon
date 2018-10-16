User.create!(name: "Amy", email: "amy@amyzon.dev", password: "testing1")

ron_rash = User.create!(name: "Ron Rash", email: "ron@ron_rash.dev", password: "testing1")

books = [
  { title: "Serena", price: 15.99 },
  { title: "One Foot in Eden", price: 24.99 },
  { title: "Saints at the River", price: 24.99 },
  { title: "Burning Bright", price: 12.99 }
]
books.each do |book|
  Book.create!(title: book[:title], price: book[:price])
end

ron_rash.books << Book.all
