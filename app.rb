Dir["models/*.rb"].each do |file|
  require_relative file
end

ActiveRecord::Base.establish_connection(
adapter: :postgresql,
database: :restaurant_db,
host: :localhost,
port: 5432
)

class EpicRestaurant < Sinatra::Base
  register Sinatra::ActiveRecordExtension

#Displays links to navigate the application (including links to each current parties)
get '/' do
	erb :welcome
end

#Display a list of food items available
get '/foods' do
	@foods = Food.all
	erb :'/foods/index'
end

#Display a form for a new food item
get '/foods/new' do
	erb :'/foods/new'
end

#Creates a new food item
post '/foods' do
	food = Food.create(params[:food])
	redirect '/foods'
end

#Display a single food item and a list of all the parties that included it
get '/foods/:id' do
	food_id = params[:id]
	@food = Food.find(food_id)

	erb :'/foods/show'
end

#Display a form to edit a food item
get '/foods/:id/edit' do
	@food = Food.find(params[:id])

	erb :'/foods/edit'
end

#Updates a food item
patch '/foods/:id' do
	food = Food.find(params[:id])
	food.update(params['id'])

	redirect '/foods'
end

#Deletes a food item
delete '/foods/:id' do
	food = Food.delete(params[:id])
	food.destroy

	redirect '/foods'
end

#Display a list of all parties
get '/parties' do

end

#Display a single party, options for adding a food item to the party and closing the party.
get '/parties/:id' do

end

#Display a form for a new party
get '/parties/new' do

end

#Creates a new party
post '/parties' do

end

#Display a form for to edit a party's details
get '/parties/:id/edit' do

end

#Updates a party's details
patch '/parties/:id' do

end

#Delete a party
delete '/parties/:id' do

end

#Creates a new order
post '/orders' do

end

#Change item to no-charge
patch '/orders/:id' do

end

#Removes an order
delete '/orders/:id' do

end

#Saves the party's receipt data to a file. Displays the content of the receipt. Offer the file for download.
get '/parties/:id/receipt' do

end

#Marks the party as paid
patch '/parties/:id/checkout' do

end

# Redirect to default route should all else fail
get "/*" do
  redirect to("/")
end

end







