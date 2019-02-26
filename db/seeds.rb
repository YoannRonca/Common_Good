# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts  "Deleting reviews....."
Review.destroy_all

puts  "Deleting mission_users....."
MissionUser.destroy_all

puts  "Deleting mission_sectors....."
MissionSector.destroy_all

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

matho = Organization.create(name: "Matho", description: "lorem")
goodkids = Organization.create(name: "Good Kids", description: "lorem")
nation = Organization.create(name: "Nation", description: "lorem")
msf = Organization.create(name: "MSF", description: "lorem")
green = Organization.create(name: "Green", description: "lorem")

puts 'Creating 6 missions...'

turtle = Mission.create(organization: matho)
culture = Mission.create(organization: green)
kids = Mission.create(organization: goodkids)
music = Mission.create(organization: msf)
art = Mission.create(organization: nation)
environment = Mission.create(organization: matho)


puts 'Creating 6 mission_users...'

MissionUser.create(user: yoann, mission: turtle, title: "live with turtle")
MissionUser.create(user: livia, mission: culture, title: "culture is annoying")
MissionUser.create(user: muriel, mission: kids, title: "kids is bad")
MissionUser.create(user: bruno, mission: music, title: "music is life")
MissionUser.create(user: yoann, mission: art, title: "art is love")
MissionUser.create(user: livia, mission: environment, title: "environment is shit")

puts 'Creating 2 reviews...'

Review.create(content: "Hello World Great Gig!", transparency: 4, social_impact: 3, staff_note: 4,  user: livia, mission: music)
Review.create(content: "Hello World Great Gig!", transparency: 4, social_impact: 3, staff_note: 4,  user: yoann, mission: culture)

puts 'Finished!'
