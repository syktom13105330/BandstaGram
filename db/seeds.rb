# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.delete_all
User.create(email:"1@gmail.com", password: 111111, name: "Band1", user_type: "g", profile: "Hi", genre: "Rock", area: "Osaka")
User.create(email:"2@gmail.com", password: 222222, name: "User2", user_type: "i", profile: "Hey", genre: "Metal", area: "Tokyo")
User.create(email:"3@gmail.com", password: 333333, name: "User3", user_type: "i", profile: "This is User3", genre: "Rock", area: "Nagoya")
User.create(email:"4@gmail.com", password: 444444, name: "Band4", user_type: "g", profile: "This is Band4", genre: "Clasic", area: "Fukuoka")
User.create(email:"5@gmail.com", password: 555555, name: "Band5", user_type: "g", profile: "Hi", genre: "Rock", area: "Osaka")
User.create(email:"6@gmail.com", password: 666666, name: "User6", user_type: "i", profile: "Hey", genre: "Metal", area: "Tokyo")
User.create(email:"7@gmail.com", password: 777777, name: "User7", user_type: "i", profile: "This is User7", genre: "Rock", area: "Nagoya")
User.create(email:"8@gmail.com", password: 888888, name: "Band8", user_type: "g", profile: "This is Band8", genre: "Clasic", area: "Fukuoka")
User.create(email:"9@gmail.com", password: 999999, name: "User9", user_type: "i", profile: "Hey", genre: "Metal", area: "Tokyo")
User.create(email:"10@gmail.com", password: 101010, name: "User10", user_type: "i", profile: "Hey", genre: "Metal", area: "Tokyo")

Friend.delete_all
Friend.create(follower:1, followed:3)
Friend.create(follower:3, followed:1)
Friend.create(follower:1, followed:2)
Friend.create(follower:4, followed:1)
Friend.create(follower:1, followed:5)
Friend.create(follower:5, followed:1)
Friend.create(follower:1, followed:6)
Friend.create(follower:6, followed:1)
Friend.create(follower:1, followed:7)
Friend.create(follower:7, followed:1)
Friend.create(follower:1, followed:8)
Friend.create(follower:8, followed:1)
Friend.create(follower:1, followed:9)
Friend.create(follower:1, followed:10)

Recruitment.delete_all
Recruitment.create(band_id:1, r_info:"Test1 from seeds", expired:"2018-12-31",part:"Gt",area:"Tokyo")
Recruitment.create(band_id:4, r_info:"Test2 from seeds", expired:"2018-12-31",part:"Ba",area:"Osaka")
Recruitment.create(band_id:5, r_info:"Test3 from seeds", expired:"2018-12-31",part:"Dr",area:"Fukuoka")


BelongBand.delete_all
BelongBand.create(user_id:2,band_id:1)
BelongBand.create(user_id:2,band_id:4)
BelongBand.create(user_id:3,band_id:5)
BelongBand.create(user_id:7,band_id:8)
BelongBand.create(user_id:10,band_id:1)