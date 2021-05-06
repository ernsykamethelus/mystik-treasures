class CrystalsController < ApplicationController

  get '/crystals' do #index route
    @crystals = Crystal.all 
    erb :'/crystals/index'
  end
  
  get '/crystals/new' do 
    erb :'crystals/new' 
  end

  post '/crystals' do 
    @crystals = current_user.crystals.new(name: params[:name],purpose: params[:purpose])
    if @crystals.save
    redirect '/crystals' 
  else
    erb :"/crystals/new"
  end
end

get "/crystals/:id" do
   erb :"/crystals/show"
end

get "/crystals/:id/edit" do
  erb :"/crystals/edit"
end

patch "/crystals/:id" do
  if @crystal.update(name: params[:name],purpose: params[:purpose])
    redirect "/crystals/#{@crystal.id}"
  else 
    erb :"/crystals/edit"
  end 
end

delete "/crystals/:id/delete" do
  @crystal.destroy
  redirect "/crystals"
   end
 end


