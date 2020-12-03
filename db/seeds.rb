# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Entering the records in the database."
(1..100).each do |x|
  if x.odd?
    first_name = "Person First " + "#{x}"
    last_name = "Person Last " + "#{x}"
    email = "email_" + "#{x}" + "@hello.com"
    age = x
    gender = "Male"
  else
    first_name = "Person First " + "#{x}"
    last_name = "Person Last " + "#{x}"
    email = "email_" + "#{x}" + "@hello.com"
    age = x
    gender = "Female"
  end
  puts "Entering record #{x} of 100."
  Person.create(first_name: first_name, last_name: last_name, email: email, age: age, gender: gender)
end