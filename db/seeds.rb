# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

Admin.create(email: 'admin@example.com', password: 'password')
Admin.create(email: 'lem@example.com', password: 'password')

10.times do
  Category.create(nazwa: Faker::Book.genre)
end

15.times do
  autor = Faker::Book.author.split
  Autor.create(imie: autor[0], nazwisko: autor[1])
end

15.times do
  Publisher.create(nazwa: Faker::Book.publisher)
end

90.times do
  Book.create(tytul: Faker::Book.title,
              autor: Autor.all.sample,
              category: Category.all.sample,
              publisher: Publisher.all.sample,
              rok_wydania: Faker::Date.between(from: Date.today - 50.years, to: Date.today - 1.year),
              opis: Faker::Lorem.paragraph)
end

10.times do
  Faker::Config.locale = 'pl'
  f_name = Faker::Name.first_name
  l_name = Faker::Name.last_name
  email = "#{f_name}.#{l_name}@exaplme.com"
  Reader.create(imie: f_name,
                nazwisko: l_name,
                email: email,
                telefon: Faker::Number.number(digits: 9),
                data_urodzenia: Faker::Date.between(from: Date.today - 60.years, to: Date.today - 10.year),
                haslo: "#{f_name}.#{l_name}")
end

100.times do
  data_w = Faker::Date.between(from: Date.today - 4.months, to: Date.today - 3.months)
  Rent.create(book: Book.available.sample,
            reader: Reader.all.sample,
            data_wypozyczenia: data_w,
            planowana_data_oddania: data_w + 2.months,
            data_oddania: data_w + 1.month)
end

70.times do
  data_w = Faker::Date.between(from: Date.today - 1.month, to: Date.today)
  Rent.create(book: Book.available.sample,
            reader: Reader.all.sample,
            data_wypozyczenia: data_w,
            planowana_data_oddania: data_w + 1.month)
end
          
10.times do
  data_w = Faker::Date.between(from: Date.today - 2.months, to: Date.today - 1.month)
  Rent.create(book: Book.available.sample,
            reader: Reader.all.sample,
            data_wypozyczenia: data_w,
            planowana_data_oddania: data_w + 1.month)
  
end

