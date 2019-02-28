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

puts "Deleting orgqnizations....."
Organization.destroy_all
# puts "Deleting missions....."
# Mission.destroy_all

puts 'Creating 4 users...'

yoann = User.create(email: "yoann@gmail.com", password: "123456")
livia = User.create(email: "livia@gmail.com", password: "123456")
muriel = User.create(email: "muriel@gmail.com", password: "123456")
bruno = User.create(email: "bruno@gmail.com", password: "123456")

puts 'Creating 6 organizations...'

matho = Organization.create(name: "Matho", description: "lorem")
goodkids = Organization.create(name: "Good Kids", description: "lorem")
nation = Organization.create(name: "Nation", description: "lorem")
msf = Organization.create(name: "MSF", description: "lorem")
green = Organization.create(name: "Green", description: "lorem")

puts 'Creating 12 missions...'

turtle = Mission.create(organization: matho, title: "Save Turtles", city: 'Bogota', home_category: "urgent")
culture = Mission.create(organization: green, title: "Culture is life", city: 'Paris', home_category: "urgent")
kids = Mission.create(organization: goodkids, title: "Little kids", city: 'Bogota', home_category: "urgent")
music = Mission.create(organization: msf, title: "Music ", city: 'Paris', home_category: "trustyworth")
art = Mission.create(organization: nation, title: "Save the art", home_category: "trustyworth")
environment = Mission.create(organization: matho, title: "Tree Free", home_category: "trustyworth")

turtle = Mission.create(organization: matho, title: "turtlito", city: 'Fortaleza', home_category: "recent")
culture = Mission.create(organization: green, title: "Culture", city: 'Paris', home_category: "recent")
kids = Mission.create(organization: goodkids, title: "Ninos", city: 'Marseille', home_category: "recent")
music = Mission.create(organization: msf, title: "Safesound ", city: 'Paris', home_category: "recent")
art = Mission.create(organization: nation, title: "VivaCultura", city: 'Lima', home_category: "recent")
environment = Mission.create(organization: matho, title: "Eco", city: 'Montreal', home_category: "recent")


puts 'Creating 6 mission_users...'

MissionUser.create(user: yoann, mission: turtle)
MissionUser.create(user: livia, mission: culture)
MissionUser.create(user: muriel, mission: kids)
MissionUser.create(user: bruno, mission: music)
MissionUser.create(user: yoann, mission: art)
MissionUser.create(user: livia, mission: environment)

puts 'Creating 2 reviews...'

Review.create(content: "Hello World Great Gig!", transparency: 4, social_impact: 3, staff_note: 4,  user: livia, mission: music)
Review.create(content: "Hello World Great Gig!", transparency: 4, social_impact: 3, staff_note: 4,  user: yoann, mission: culture)

puts 'Finished!'


["Agriculture",
"Arts & Music",
" Children & Youth",
"Civic Engagement",
"Climate change",
"Community Development",
"Conflict Resolution",
"Consumer Protection",
"Crime & Safety",
"Disability",
"Economic Development",
"Education",
"Energy",
"Environment",
"Health & Medicine",
"Human Rights & Civil Liberties",
"Immigrants or Refugees",
"LGBTQ",
"Poverty",
"Race & Ethnicity",
"Religion & Spirituality",
"Reproductive Health/Rights",
"Sexual Abuse & Human Trafficking",
"Transparency & Oversight",
"Victim Support",
"Water & Sanitation",
"Women",
"Wildlife Protection"].each do |sector|
  Sector.create! name: sector
end


MissionSector.create!(
  mission: turtle,
  sector: Sector.first
)
MissionSector.create!(
  mission: turtle,
  sector: Sector.second
)
MissionSector.create!(
  mission: turtle,
  sector: Sector.third
)
MissionSector.create!(
  mission: culture,
  sector: Sector.fourth
)
MissionSector.create!(
  mission: culture,
  sector: Sector.second
)
MissionSector.create!(
  mission: culture,
  sector: Sector.third
)
