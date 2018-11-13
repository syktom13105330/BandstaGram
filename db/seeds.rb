# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Friend.delete_all
Friend.create(follower:1, followed:3)
Friend.create(follower:3, followed:1)
Friend.create(follower:1, followed:2)
Friend.create(follower:4, followed:1)

User.delete_all
User.create(emal:1@gmail.com, password: 111111, name: "Band1", user_type: "g", profile: "Hi", genre: "Rock", area: "Osaka")
User.create(emal:2@gmail.com, password: 222222, name: "User2", user_type: "i", profile: "Hey", genre: "Metal", area: "Tokyo")
User.create(emal:3@gmail.com, password: 333333, name: "User3", user_type: "i", profile: "This is User3", genre: "Rock", area: "Nagoya")
User.create(emal:4@gmail.com, password: 444444, name: "Band4", user_type: "g", profile: "This is Band4", genre: "Clasic", area: "Fukuoka")