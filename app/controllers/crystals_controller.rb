class CrystalController < ApplicationController

  get '/crystals' do 
    @crystals = Crystal.all 
    erb :'/crystals/index'
  end
  
  get '/crystals/new' do
    @crystal = Crystal.new
    erb :"/crystals/new" 
  end

  post '/crystals' do 
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
  # @crystal = Crystal.find_by_id(params[:id])
   erb :"/crystals/show"
end

get "/crystals/:id/edit" do #load edit form
  get_crystal
  not_able_to_edit
  # @crystal = Crystal.find_by_id(params[:id])
  erb :"/crystals/edit"
end

patch "/crystals/:id" do #update the crystal
  get_crystal
  not_able_to_edit
   if @crystal.update(params[:crystal])
    @crystal.save
    redirect "/crystals/#{@crystal.id}"
  else 
    erb :"/crystals/edit"
  end 
end

delete "/crystals/:id/delete" do #delete action
  get_crystal
  not_able_to_edit
  # @crystal = Crystal.find_by_id(params[:id])
  @crystal.delete
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
    redirect "/crystals"
  end
end

def authorize_crystal(crystal)
  current_user == crystal.user
  end
end




