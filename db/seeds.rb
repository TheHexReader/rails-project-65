# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

(1..5).each do |i|
  Category.create!(name: "Category №#{i}")
end

101.times do |_|
  Bulletin.create!(title: Faker::Book.title, description: Faker::Lorem.sentence, category_id: Category.all.sample.id,
                   user_id: User.first.id, aasm_state: 'published')
end
