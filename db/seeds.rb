# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require "open-uri"

puts("Cleaning database")
Art.destroy_all

name = ["A breath of fresh air", "You and me, me and you", "All is connected", "A cosmic projection"]
price = [100, 200, 300, 400, 500, 600, 700, 800, 900, 1000]

file1 = "https://images.unsplash.com/photo-1605721911519-3dfeb3be25e7?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=435&q=80"
file2 = "https://images.unsplash.com/photo-1604871000636-074fa5117945?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80"
file3 = "https://images.unsplash.com/photo-1629196911514-cfd8d628ba26?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=399&q=80"
file4 = "https://images.unsplash.com/photo-1629196914375-f7e48f477b6d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=406&q=80"
file5 = "https://images.unsplash.com/photo-1541961017774-22349e4a1262?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=458&q=80"
file6 = "https://images.unsplash.com/photo-1564951434112-64d74cc2a2d7?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80"

image = [file1, file2, file3, file4, file5, file6].sample

4.times do
  puts("Creating Art")
  art = Art.new(
    name: name.sample,
    price: price.sample
  )
  photos = []
  3.times do
    file = URI.open(image)
    photo = art.photos.attach(io: file, filename: "art1.png", content_type: "image/png")
    photos.push(photo)
    puts("Creating Photos")
  end
  art.save
end

puts("Created seeds")
