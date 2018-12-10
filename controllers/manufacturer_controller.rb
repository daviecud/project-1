require('sinatra')
require('sinatra/contrib/all')

require_relative('./models/manufacturer.rb')
also_reload('./models/*')

get '/manufacturer' do
  erb(:index)
end
