require 'faker'

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

p "Seeding database..."

# Create users
p "Creating users..."

6.times do
    User.create(
        name: Faker::Name.name
    )
    end

# Create foods
p "Creating recipes..."

User.all.each do |user|

    5.times do
        user.recipes.create(
            name: Faker::Food.dish,
            description: Faker::Food.description,
            public: Faker::Boolean.boolean,
            preparation_time: rand(1..12),
            cooking_time: rand(1..12)
        )
        end
end

# Create foods
p "Creating foods..."

User.all.each  do |user|
    
    10.times do
        user.foods.create(
            name: Faker::Food.unique.ingredient,
            measurement_unit: Faker::Food.measurement,
            price: rand(1.0..10.0).round(2),
            quantity: rand(1..10),
        )
        end
end

p "Database seeded!"

p "Successfully created #{User.count} users"
p "Successfully created #{Recipe.count} recipes"
p "Successfully created #{Food.count} foods"