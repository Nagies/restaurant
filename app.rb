#establish connection with database
ActiveRecord::Base.establish_connection(
adapter: :postgresql,
database: :restaurant_db,
host: :localhost,
port: 5432
)

require_relative 'models/food'
require_relative 'models/parties'
require_relative 'models/order'

class EpicRestaurant < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  enable :method_override

get '/' do
	erb :welcome
end

get '/foods' do
	@foods = Food.all
	erb :'/foods/index'
end

get '/foods/new' do
	erb :'/foods/new'
end

get '/foods/:id' do
	food_id = params[:id]
	@food = Food.find(food_id)

	erb :'/foods/show'
end

post '/foods' do
	food = Food.create(params[:food])
	redirect '/foods'
end


get '/foods/:id/edit' do
	@food = Food.find(params[:id])

	erb :'/foods/edit'
end

patch '/foods/:id' do
	@food = Food.find(params[:id])
	food.update(params[:food])

	redirect '/foods'
end

delete '/foods/:id' do |id|
	food = Food.find(params[:id])
	food.destroy

	redirect '/foods'
end

get '/parties' do
	@party = Party.all
	erb :'/parties/index'
end

get '/parties/new' do
	erb :'/parties/new'
end

get '/parties/:id' do
	@foods = Food.all
	party_id = params[:id]
	@party = Party.find(party_id)

	erb :'/parties/show'
end

post '/parties' do
	party = Party.create(params[:party])
	redirect '/parties'
end

get '/parties/:id/edit' do
	@party = Party.find(params[:id])

	erb :'parties/edit'
end

patch '/parties/:id' do
	party = Party.find(params[:id])
	party.update(params[:party])

	redirect to "/parties"
end

delete '/parties/:id' do
	party = Party.find(params[:id])
	party.destroy

	redirect to "/parties"
end


post '/parties/:id/order' do
	order = Order.new(params[:order])
	order.party_id = params[:id]
	order.save!

	redirect to "/parties"
end

patch '/orders/:id' do
end

delete '/orders' do
	order = Order.find(params['order_id'])
	order.quantity -= 1
	if order.quantity <= 0
		order.destroy
	else
	order.save!
	end
	redirect to '/parties'
end

#Saves the party's receipt data to a file. Displays the content of the receipt. Offer the file for download.
get '/parties/:id/receipt' do
	@party = Party.find(params[:id])
	@foods = @party.foods

	erb :'/parties/receipt'
end

#Marks the party as paid
patch '/parties/:id/checkout' do

end

# Redirect to default route should all else fail
get "/*" do
  redirect to("/")
end

end







