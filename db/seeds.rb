# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

until Post.count == 20 
    num = Post.count+1;
    p = Post.create(
      title: "Image"+num.to_s,
      image: "https://picsum.photos/400/300"
    )
    # p.image.attach(io: File.open('https://picsum.photos/400/300'), filename: 'file.jpg')

end