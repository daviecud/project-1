require('sinatra')
require('sinatra/contrib/all')

require_relative('./models/manufacturer.rb')
require_relative('./models/product.rb')
also_reload('./models/*')

get '/manufacturer' do
  erb(:"manufacturers/index")
end
