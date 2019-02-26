# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Deleting users....."
User.destroy_all

puts "Deleting missions....."
Mission.destroy_all

puts 'Creating 4 users...'

yoann = User.create(email: "yoann@gmail.com", password: "123425")
livia = User.create(email: "livia@gmail.com", password: "564278")
muriel = User.create(email: "muriel@gmail.com", password: "928765")
bruno = User.create(email: "bruno@gmail.com", password: "543221")

puts 'Creating 6 organizations...'

Organization.create(name: "Matho", description: "lorem")
Organization.create(name: "Pigalle", description: "lorem")
Organization.create(name: "Nation", description: "lorem")
Organization.create(name: "Tour eiffel", description: "lorem")
Organization.create(name: "Green", description: "lorem")

puts 'Creating 6 missions...'

turtle = Mission.create
culture = Mission.create
kids = Mission.create
music = Mission.create
art = Mission.create
environment = Mission.create

puts 'Creating 2 reviews...'

Review.create(content: "Hello World Great Gig!", transparency: 4, social_impact: 3, staff_note: 4,  user: livia, mission: music)
Review.create(content: "Hello World Great Gig!", transparency: 4, social_impact: 3, staff_note: 4,  user: yoann, mission: culture)

puts 'Finished!'
