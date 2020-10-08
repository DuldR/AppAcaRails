# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

u = User.new(username: "coolguy420")
u.password = "123456"
u.save!

Goal.create(body: "What a goal!", title: "my goal", status: "OPEN", user_id: 1)

Comment.create(title: "User Comment", body: "User has joind your channel", commentable_type: "User", commentable_id: 1)
Comment.create(title: "Goal Comment", body: "Goal has joind your channel", commentable_type: "Goal", commentable_id: 1)