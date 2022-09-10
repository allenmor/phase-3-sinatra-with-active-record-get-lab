class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  # add routes
  get '/bakeries' do
    bakeries = Bakery.all

    bakeries.to_json

  end

  get '/bakeries/:id' do
    bakery = Bakery.find(params[:id])

    bakery.to_json(include: :baked_goods)
  end

  get '/baked_goods/by_price' do
    descending_prices = BakedGood.order(price: :desc)

    descending_prices.to_json
  end
  get '/baked_goods/most_expensive' do
    most = BakedGood.order(price: :desc).first

    most.to_json
  end
end
