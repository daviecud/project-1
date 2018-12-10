require('sinatra')
require('sinatra/contrib/all')

require_relative('../models/product.rb')
also_reload('./models/*')

get '/product' do
  erb(:index)
end

# get '/product' do
#   @products = Product.all()
#   erb(:index)
# end
