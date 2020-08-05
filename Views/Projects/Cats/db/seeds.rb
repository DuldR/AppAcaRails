# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Cat.create!(birth_date: "2020/01/01", color: "Blue", name: "Idiot", sex: "F", description: "Idiot baby")
Cat.create!(birth_date: "1999/01/01", color: "Red", name: "Dumb", sex: "M", description: "BIG BOOTS")
Cat.create!(birth_date: "2010/01/01", color: "Red", name: "Stupid", sex: "M", description: "CLOWN ASS")
Cat.create!(birth_date: "2011/01/01", color: "Blue", name: "Moron", sex: "F", description: "Smoke WEED")
Cat.create!(birth_date: "2012/01/01", color: "Red", name: "Clown", sex: "M", description: "Ket's FDdsf")


CatRentalRequest.create!(cat_id: 1, start_date: "2020/01/02", end_date: "2020/01/03", status: "PENDING")
CatRentalRequest.create!(cat_id: 2, start_date: "2020/04/01", end_date: "2020/04/06", status: "PENDING")
CatRentalRequest.create!(cat_id: 3, start_date: "2020/03/01", end_date: "2020/03/01", status: "PENDING")
CatRentalRequest.create!(cat_id: 4, start_date: "2020/06/01", end_date: "2020/06/05", status: "PENDING")
CatRentalRequest.create!(cat_id: 1, start_date: "2020/07/01", end_date: "2020/07/08", status: "APPROVED")