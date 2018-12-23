# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.delete_all
User.create(email:"1@gmail.com", password: 111111, name: "Band1", user_type: "g", profile: "Hi", genre: "1", area: "1")
User.create(email:"2@gmail.com", password: 222222, name: "User2", user_type: "i", profile: "Hey", genre: "5", area: "2", part: "1")
User.create(email:"3@gmail.com", password: 333333, name: "User3", user_type: "i", profile: "This is User3", genre: "1", area: "3", part: "2")
User.create(email:"4@gmail.com", password: 444444, name: "Band4", user_type: "g", profile: "This is Band4", genre: "7", area: "4")
User.create(email:"5@gmail.com", password: 555555, name: "Band5", user_type: "g", profile: "Hi", genre: "1", area: "5")
User.create(email:"6@gmail.com", password: 666666, name: "User6", user_type: "i", profile: "Hey", genre: "5", area: "6", part: "3")
User.create(email:"7@gmail.com", password: 777777, name: "User7", user_type: "i", profile: "This is User7", genre: "1", area: "7", part: "4")
User.create(email:"8@gmail.com", password: 888888, name: "Band8", user_type: "g", profile: "This is Band8", genre: "10", area: "8")
User.create(email:"9@gmail.com", password: 999999, name: "User9", user_type: "i", profile: "Hey", genre: "2", area: "9", part: "1")
User.create(email:"10@gmail.com", password: 101010, name: "User10", user_type: "i", profile: "Hey", genre: "3", area: "10", part: "2")

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
Recruitment.create(band_id:1, r_info:"Test1 from seeds", expired:"2018-12-31",part:"1" ,area:"1", genre:"1")
Recruitment.create(band_id:4, r_info:"Test2 from seeds", expired:"2018-12-31",part:"2" ,area:"2", genre:"2")
Recruitment.create(band_id:5, r_info:"Test3 from seeds", expired:"2018-12-31",part:"3" ,area:"6", genre:"3")

BelongBand.delete_all
BelongBand.create(user_id:2,band_id:1)
BelongBand.create(user_id:2,band_id:4)
BelongBand.create(user_id:3,band_id:5)
BelongBand.create(user_id:7,band_id:8)
BelongBand.create(user_id:10,band_id:1)

Part.delete_all
Part.create(part_name:"Lead Vocals")
Part.create(part_name:"Guitar")
Part.create(part_name:"Bass")
Part.create(part_name:"Drums")
Part.create(part_name:"Keyboards")
Part.create(part_name:"Strings")
Part.create(part_name:"Other")

Genre.delete_all
Genre.create(genre_name:"Rock")
Genre.create(genre_name:"Pop")
Genre.create(genre_name:"R&B")
Genre.create(genre_name:"Jazz")
Genre.create(genre_name:"Metal")
Genre.create(genre_name:"Folk")
Genre.create(genre_name:"Classic")
Genre.create(genre_name:"Dance")
Genre.create(genre_name:"Anime")
Genre.create(genre_name:"Alternative")

Area.delete_all
Area.create(c_name:"JP",a_name:"Tokyo")
Area.create(c_name:"JP",a_name:"Osaka")
Area.create(c_name:"JP",a_name:"Nagoya")
Area.create(c_name:"JP",a_name:"Fukuoka")
Area.create(c_name:"JP",a_name:"Sendai")
Area.create(c_name:"USA")
Area.create(c_name:"UK")
Area.create(c_name:"Canada")
Area.create(c_name:"Brazil")
Area.create(c_name:"Singapore")
Area.create(c_name:"China")
Area.create(c_name:"South Korea")

Room.delete_all
Room.create

Entry.delete_all
Entry.create(user_id:1, room_id:1)
