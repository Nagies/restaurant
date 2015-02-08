require 'pg'
require 'active_record'
require 'pry'

#LOAD ERROR ON 6
require_relative 'models/food.rb'
require_relative 'models/order.rb'
require_relative 'models/parties.rb'

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
    cuisine_type: 'House Specialties',
    description: 'Fried Boneless Breast of Chicken Pieces & a Honey Mustard Aioli Drizzle
on Cheddar Green Onion with Peppadew-Jalapeño Butter, dusted
with Cajun Spice',
    price: 15,
    allergens:'Gluten',
    created_at: Time.now,
    updated_at: Time.now
  },
  {
    name: 'Beef and Eggs',
    cuisine_type: 'House Specialties',
    description: '5 oz. Beef Tenderloin Center Cut Filet on Fried Green Tomatoes, Two Farm
Fresh Eggs Any Style, choice of: Stone Ground Grits with Diced Bacon or
Shredded Potato & Onion Hash Browns & a House-Made Biscuit',
    price: 20,
    allergens: 'None',
    created_at: Time.now,
    updated_at: Time.now
  },
  {
    name: 'Fresh Coffee',
    cuisine_type: 'Drinks',
    description: 'Organic, Local & Fair Trade',
    price: 3,
    allergens: 'None',
    created_at: Time.now,
    updated_at: Time.now
  }
].each do |food|
  Food.create( food )
end

[
  {
    table_number: 1,
    number_of_guests: 2,
    paid: false,
    created_at: Time.now,
    updated_at: Time.now
  },
  {
    table_number: 2,
    number_of_guests: 4,
    paid: false,
    created_at: Time.now,
    updated_at: Time.now
  },
  {
    table_number: 3,
    number_of_guests: 3,
    paid: true,
    created_at: Time.now,
    updated_at: Time.now
  }
].each do |party|
  Party.create( party )
end




























