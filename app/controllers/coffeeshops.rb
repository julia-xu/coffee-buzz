get '/coffeeshops' do
  if Coffeeshop.all.length > 0
    Coffeeshop.all.each do |coffeeshop|
      coffeeshop.destroy
    end
    ActiveRecord::Base.connection.reset_pk_sequence!('coffeeshops')
  end
  coffeeshop = Coffeeshop.create(search(params['location']))
  redirect "/coffeeshops/#{coffeeshop.id}"
end

get '/coffeeshops/:id' do
  @coffeeshop = Coffeeshop.find(params[:id])
  erb :'/coffeeshops/show'
end
