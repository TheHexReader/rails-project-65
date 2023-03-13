# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

for i in 1..5 do
  Category.create!(name: "Category №#{i}")
end

for _ in 0..100 do
  Bulletin.create!(title: Faker::Book.title, description: Faker::Lorem.sentence, category_id: Category.all.sample.id, user_id: User.first.id, aasm_state: "published")
end
