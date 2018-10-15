User.create!(name: "Amy", email: "amy@amyzon.dev", password: "testing1")

ron_rash = User.create!(name: "Ron Rash", email: "ron@ron_rash.dev", password: "testing1")

titles = ["Serena", "One Foot in Eden", "Saints at the River", "Burning Bright"]
titles.each do |title|
  Book.create!(title: title)
end

ron_rash.books << Book.all
