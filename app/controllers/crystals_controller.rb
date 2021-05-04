class CrystalsCrontroller < ApplicationController

  get '/crystals' do #index route
    @crystals = Crystal.all 
    # @healing_crystals = Crystals.all
    # puts @healing_crystals 
    erb :'/crystals/index'
  end
  
  get '/crystals/new' do 
    erb :'crystals/new' 
  end

  post '/crystals' do 
    @crystals = current_user.jokes.new(name: params[:name],purpose: params[:purpose])
    if @crystals.save
    redirect :'/crystals' 
  else
    erb :"/crystals/new"
  end
end

#   get '/crystals/:id' do #show route
#     # @selected_crystal = Org_Crystals(params[:id]).to_i
#     # @idx = params[:id].to_i
#     # @crystals = ['empowering', 'protective', 'optimism', 'grounding', 'growth', 
#     # 'strenghten', 'prosperity', 'vitality', 'purifying', 'harmonizing'].sample(5)
#     erb :'crystals/show'
#  end


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


