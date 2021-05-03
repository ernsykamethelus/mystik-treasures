class CrystalCrontroller < ApplicationController

  get '/crystals' do #index route
    @crystals = Crystals.all 
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

  get '/crystals/:id' do #show route
    # @selected_crystal = Org_Crystals(params[:id]).to_i
    # @idx = params[:id].to_i
    # @crystals = ['empowering', 'protective', 'optimism', 'grounding', 'growth', 
    # 'strenghten', 'prosperity', 'vitality', 'purifying', 'harmonizing'].sample(5)
    erb :'crystal/show'
 end

 delete '/crystal/:id' do 
    # binding.pry 
 end
end