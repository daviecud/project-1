require('sinatra')
require('sinatra/contrib/all') if development?

require_relative('./inventory_controller.rb')

require_relative('./models/manufacturer.rb')
require_relative('./models/product.rb')


get '/' do
  erb(:home)
end

get '/manufacturers' do
  @manufacturer = Manufacturer.all()
  erb(:"manufacturers/index")
end

get '/manufacturers/new' do
  erb(:"manufacturers/new")
end

post '/manufacturers' do
  Manufacturer.new(params).save
  redirect to '/manufacturers'
end

get '/manufacturers/:id' do
  @manufacturer = Manufacturer.find(params['id'])
  erb(:"manufacturers/show")
end

post '/manufacturers' do
  @manufacturer = Manufacturer.new(params)
  @manufacturer.save()
  erb(:"manufacturers/create")
end

get '/manufacturers/:id/:edit' do
  @manufacturer = Manufacturer.find(params[:id])
  erb(:"manufacturers/edit")
end

post 'manufacturers/:id' do
  Manufacturer.new(params).update
  redirect to '/manufacturers'
end

post 'manufacturers/:id/delete' do
  manufacturer = Manufacturer.find(params[:id])
  manufacturer.delete()
  redirect to '/manufacturers'
end
