# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.delete_all

User.create!(first_name:  "Denise",
              last_name:  "Owner",
             email: "denise@thebestrestaurant.org",
             password:              "foobar",
             password_confirmation: "foobar",
             admin: true)

10.times do |n|
  first_name  = Faker::Name.first_name
  last_name  = Faker::Name.last_name
  email = "#{first_name}_#{n+1}@gmail.org"
  password = "password"
  User.create!(first_name:  first_name,
                last_name: last_name,
               email: email,
               password:              password,
               password_confirmation: password)
end

# 20.times do |n|
#   desc = Faker::Food.description
#   Meal.create!(description: desc)
# end
