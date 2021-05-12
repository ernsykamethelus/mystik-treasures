class CrystalController < ApplicationController

  get '/crystals' do #index route
    @crystals = Crystal.all 
    erb :'/crystals/index'
  end
  
  get '/crystals/new' do 
    @crystal = Crystal.new
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
  @user = current_user
  @crystal = Crystal.find(params[:id])
  # if not_able_to_edit
   erb :"/crystals/show"
end

get "/crystals/:id/edit" do
  user_not_logged_in
  @crystal = Crystal.find(params[:id])
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
  not_able_to_edit
  @crystal.destroy
  redirect "/crystals"
end

def choose_a_crystal
  @crystal = Crystal.find_by_id(params[:id])
end

def not_able_to_edit
  user_not_logged_in
    redirect '/crystals'
  end
end


