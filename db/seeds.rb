# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Post.destroy_all 
ChecklistItem.destroy_all
User.destroy_all

user77 = User.create(username:"user77", password:"77")
user21 = User.create(username:"user21", password:"21")


Post.create(title: "Play", description: "Playing", user: user21)
Post.create(title: "Test", description: "Testing", user: user77)

ChecklistItem.create(item: "Helmet", user: user77)
ChecklistItem.create(item: "Helmet", user: user21)