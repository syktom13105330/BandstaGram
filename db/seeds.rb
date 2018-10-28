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
