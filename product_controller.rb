require('sinatra')
require('sinatra/contrib/all')

require_relative('./models/product.rb')
require_relative('./models/manufacturer.rb')
also_reload('./models/*')

get '/products' do
  @products = Product.all()
  erb(:"products/index")
end

get '/products/new' do
  @products = Manufacturer.all()
  erb(:"products/new")
end

post '/products' do
  Product.new(params).save
  redirect to '/products'
end

get '/products/:id' do
  @product = Product.find(params['id'])
  erb(:"products/show")
end

get '/products/:id/edit' do
  @manufacturers = Manufacturer.all
  @product = Product.find(params['id'])
  erb(:"products/edit")
end

post '/products/:id' do
  product = Product.new(params)
  product.update
  redirect to "/products/#{params['id']}"
end

post '/products/:id/delete' do
  product = Product.find(params['id'])
  product.delete
  redirect to '/products'
end


# get '/product' do
#   @products = Product.all()
#   erb(:index)
# end
