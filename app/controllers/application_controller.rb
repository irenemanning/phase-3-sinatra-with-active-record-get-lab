class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  # add routes
  
  get '/bakeries' do
    # get all the bakeries from the database
    bakeries = Bakery.all
    # send them back as a JSON array
    bakeries.to_json
  end
  
  get '/bakeries/:id' do
    bakery_by_id = Bakery.find(params[:id])
    bakery_by_id.to_json(only: [:name], include: {baked_goods: { only: [:name, :price]}})
  end

  get '/baked_goods/by_price' do
    #get all baked goods 
    baked_goods_by_price = BakedGood.all.order(price: :desc)
    #sort baked goods by price in decending order
    baked_goods_by_price.to_json
  end

  get '/baked_goods/most_expensive' do 
    most_expensive = BakedGood.all.order(price: :desc).first
    most_expensive.to_json
  end

end
