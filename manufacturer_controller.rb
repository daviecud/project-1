require('sinatra')
require('sinatra/contrib/all')

require_relative('./models/manufacturer.rb')
require_relative('./models/product.rb')
also_reload('./models/*')

get '/' do
  erb(:home)
end

get '/manufacturers' do
  @manufacturer = Manufacturer.all()
  erb(:"manufacturers/index")
end

get '/manufacturers/:id' do
  @manufacturer = Manufacturer.find(params['id'])
  erb(:"manufacturers/show")
end
