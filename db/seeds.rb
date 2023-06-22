# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
#
[1..10].each  do |num|
  User.create(name: 'Khan', photo: 'Photo',bio: 'offfff!', posts_counter: 0)
end


[1..8].each  do |num|

  first_user = User.first
 Post.create(author_id: first_user.id, title: "post #{num}", text: "This is my #{num} post")

end

[1..8].each do |num|
  first_post = Post.first
  second_user = User.last
  Comment.create(post_id: first_post.id, author_id: second_user.id, text: "Hi #{num} #{second_user.name}" )
end
