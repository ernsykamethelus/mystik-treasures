class CrystalController < ApplicationController

  get '/crystals' do #index route
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
    @crystal = current_user.crystals.new(name: params[:name],purpose: params[:purpose])
    if @crystal.save
    redirect "/crystals" 
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
  # @crystal = Crystal.find(params[:id])
  erb :"/crystals/edit"
end

patch "/crystals/:id" do
  get_crystal
  user_not_logged_in
  if @crystal.update(name: params[:name],purpose: params[:purpose])
    redirect "/crystals/#{@crystal.id}"
  else 
    erb :"/crystals/edit"
  end 
end

delete "/crystals/:id/delete" do
  get_crystal
  not_able_to_edit
  @crystal.destroy
  redirect "/crystals"
end

def get_crystal
  @crystal = Crystal.find_by_id(params[:id])
  if @crystal.nil?
    redirect "/crystals"
  end
end

# def choose_a_crystal
#   @crystal = Crystal.find_by_id(params[:id])
# end

def not_able_to_edit
  user_not_logged_in
  if !authorize_crystal(@crystal) 
    redirect '/crystals'
  end
end

def authorize_crystal(crystal)
  # true
  current_user == crystal.user
  end
end




