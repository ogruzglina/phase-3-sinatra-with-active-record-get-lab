class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  # add routes
  get '/bakeries' do 
    # '<h2>Hello World</h2>'
    Bakery.all.to_json
  end

  get '/bakeries/:id' do 
    Bakery.find(params[:id]).to_json(include: :baked_goods)
  end

  get '/baked_goods/by_price' do 
    BakedGood.by_price.to_json
  end

  get '/baked_goods/most_expensive' do 
    BakedGood.by_price.first.to_json
  end
end
