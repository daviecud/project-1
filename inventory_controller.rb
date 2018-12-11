require('sinatra')
require('sinatra/contrib/all')

require_relative('./models/product.rb')
require_relative('./models/manufacturer.rb')
# require_relative('./controllers/manufacturer_controller.rb')
# require_relative('./controllers/product_controller.rb')
also_reload('./models/*')

get '/' do
  erb(:home)
end

get '/inventory' do
  @products = Product.all()
  erb(:"inventory/index")
end

get '/inventory/new' do

end

get '/inventory/products' do
  erb(:"inventory/show")
end



post 'inventory' do
  Product.new(params).save
  redirect to '/inventory'
end

get '/inventory/:id' do
  @products = Product.find(params['id'])
  erb(:"inventory/show")
end
