class CrystalController < ApplicationController

  get '/crystals' do 
    user_not_logged_in
    @crystals = Crystal.all 
    erb :'/crystals/index'
  end
  
  get '/crystals/new' do 
    user_not_logged_in
    @crystal = Crystal.new
    erb :"/crystals/new" 
  end

  post '/crystals' do 
    user_not_logged_in
    @crystal = current_user.crystals.new(params[:crystal])
    if @crystal.save
    redirect "/crystals/#{@crystal.id}" 
  else
    erb :"/crystals/new"
  end
end

get "/crystals/:id" do
  user_not_logged_in
  get_crystal
   erb :"/crystals/show"
end

get "/crystals/:id/edit" do
  get_crystal
  user_not_logged_in
  erb :"/crystals/edit"
end

patch "/crystals/:id" do
  get_crystal
  user_not_logged_in
  if @crystal.update(params[:crystal])
    redirect "/crystals/#{@crystal.id}"
  else 
    erb :"/crystals/edit"
  end 
end

delete "/crystals/:id/delete" do
  get_crystal
  not_able_to_edit
  @crystal.destroy
  redirect "/users/#{session[:id]}"
end

def get_crystal
  @crystal = Crystal.find_by_id(params[:id])
  if @crystal.nil?
    redirect "/crystals"
  end
end


def not_able_to_edit
  user_not_logged_in
  if !authorize_crystal(@crystal) 
    redirect '/crystals'
  end
end

def authorize_crystal(crystal)
  current_user == crystal.user
  end
end




