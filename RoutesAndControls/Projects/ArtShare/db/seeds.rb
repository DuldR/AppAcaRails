# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(username: "Originator")
User.create!(username: "Viewer")
Artwork.create!(title: "Beautiful Picture", image_url:"Pornhub.com", artist_id: 1)
ArtworkShare.create!(viewer_id: 2, artwork_id: 1)