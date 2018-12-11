require('sinatra')
require('sinatra/contrib/all')

require_relative('./models/product.rb')
require_relative('./models/manufacturer.rb')
also_reload('./models/*')

get '/' do
  erb(:home)
end

get '/inventory' do
  @products = Product.all()
  erb(:"inventory/index")
end

get '/inventory/new' do
  erb(:"inventory/new")
end

post '/inventory' do
  Product.new(params).save
  redirect to '/inventory'
end

get '/inventory/:id' do
  @products = Product.find(params['id'])
  erb(:"inventory/show")
end
