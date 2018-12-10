require('sinatra')
require('sinatra/contrib/all')

# require_relative('./controllers/manufacturer_controller.rb')
# require_relative('./controllers/product_controller.rb')
# also_reload('./models/*')

get '/' do
  erb(:home)
end
