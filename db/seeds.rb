# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.delete_all
Event.delete_all
Attendance.delete_all

emails = ["qitutiniss-5449@yopmail.com", "aqaddoril-4796@yopmail.com", "qozumeli-8462@yopmail.com", "samidegyw-3581@yopmail.com",
          "edamegorr-1480@yopmail.com", "enoffiffik-6506@yopmail.com", "exinneza-0237@yopmail.com", "ixugodady-5496@yopmail.com"]
for i in 0..7
  User.create(email: emails[i], encrypted_password: Faker::Internet.password(min_length: 8),
              description: Faker::Lorem.sentence(word_count: 20), first_name: Faker::Name.first_name,
              last_name: Faker::Name.last_name)
end


durations = rand(1..30)*5
price = rand(1..100)
for i in 0..7
  Event.create(start_date: Faker::Date.forward(days: 100), duration: durations, title: Faker::Book.title,
               description: Faker::Lorem.sentence(word_count: 30), price: price,
               location: Faker::Address.city, user_id: User.all.sample.id)
end


for i in 0..7
  Attendance.create(stripe_customer_id: Faker::Number.number,
                    user_id: User.all.sample.id, event_id: Event.all.sample.id)
end
