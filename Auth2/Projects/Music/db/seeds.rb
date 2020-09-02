# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Band.create!(name: "CoolGuys")
Band.create!(name: "TheCoolerGuys")
Band.create!(name: "CoolestGuys")

Album.create(title: "We are the CoolGuys", year: 1969, band_id: 1, studio: false)
Album.create(title: "We are the CoolerGuys", year: 1420, band_id: 2, studio: true)
Album.create(title: "We are the CoolestGuys", year: 2020, band_id: 3, studio: true)