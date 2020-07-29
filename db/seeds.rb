# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'open-uri'
20.times do |n|
  image_post = ImagePost.create(title: "Image#{n}")
  image_url = "https://picsum.photos/id/#{n}/200/300"
  p "Downloading #{image_url}..."
  downloaded_file = URI.parse(image_url).open
  image_post.image.attach(io: downloaded_file, filename: 'foo.png')
  image_post.save
  p "Created #{image_post.title} with id: #{image_post.id}"
end
p "Created #{ImagePost.count} image posts"
