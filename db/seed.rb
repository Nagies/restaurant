require 'pg'
require 'active_record'
require 'pry'

Dir["../models/*.rb"].each do |file|
  require_relative file
end

ActiveRecord::Base.establish_connection(
adapter: :postgresql,
database: :restaurant_db,
host: :localhost,
port: 5432
)

# Create some food
[
  {
    name: 'Fried Pickles',
    cuisine_type: 'Starters',
    description: 'Spicy Red Mayo',
    price: 9,
    allergens: 'Gluten',
    created_at: Time.now,
    updated_at: Time.now
  },
  {
    name: 'Fried Green Tomatoes',
    cuisine_type: 'Starters',
    description: 'Jumbo Lump Crab Meat and Lemon-Herb Aioli',
    price: 12,
    allergens: 'Gluten',
    created_at: Time.now,
    updated_at: Time.now
  },
  {
    name: 'Chicken and Waffles',
    cuisine_type: 'Full Plates',
    description: 'Fried Boneless Breast of Chicken Pieces & a Honey Mustard Aioli Drizzle
on Cheddar Green Onion with Peppadew-Jalapeño Butter, dusted
with Cajun Spice',
    price: 15,
    allergens:'Gluten',
    created_at: Time.now,
    updated_at: Time.now
  }
].each do |food|
  Food.create( food )
end

# # Create some weapons
# [
#   {
#     name: 'Venomous Snake',
#     category: 'Poison',
#     description: 'Snake bites paralyze target.',
#     #figure out how to do a damage over time effect
#     damage: 10,
#     hero_id: 1,
#     created_at: Time.now,
#     updated_at: Time.now
#   },
#   {
#     name: 'Cutting words',
#     category: 'Psychological',
#     description: 'Humiliates you in front of your peers.',
#     damage: 40,
#     hero_id: 2,
#     created_at: Time.now,
#     updated_at: Time.now
#   }
# ].each do |weapon|
#   Weapon.create( weapon )
# end
