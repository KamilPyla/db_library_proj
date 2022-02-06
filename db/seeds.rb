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
  Pulisher.create(nazwa: Faker::Book.publisher)
end

150.times do
  Book.create(tytul: Faker::Book.title,
              autor: Autor.all.sample,
              category: Category.all.sample,
              publisher: Publisher.all.sample,
              rok_wydania: (1900..2022).to_a.sample,
              opis: Faker::Lorem.paragraph)
end

