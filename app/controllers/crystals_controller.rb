class CrystalCrontroller < ApplicationController

  get '/crystals' do #index route
    @crystals = Crystals.all 
    # @healing_crystals = Crystals.all
    # puts @healing_crystals 
    erb :'/crystals/index'
  end
  
  get '/crystals/new' do #create pt 1 route. referred to as 'new'
    erb :'crystals/new' 
  end

  post '/crystals' do #create pt 2 route
    #always check params with forms
  if params[:stone] == ''
    erb :'crystal/new' 
  else
    ORG_CRYSTALS << params[:stone]
    #redirect to show route
    redirect "/crystals/#{ORG_CRYSTALS.index(params[:stone])}"
  end
end

  get '/crystals/:id' do #show route
    @selected_crystal = Org_Crystals(params[:id]).to_i
    @idx = params[:id].to_i
    @crystals = ['empowering', 'protective', 'optimism', 'grounding', 'growth', 
    'strenghten', 'prosperity', 'vitality', 'purifying', 'harmonizing'].sample(5)

    erb :'crystal/show'
 end

 delete '/crystal/:id' do 
    # binding.pry 
 end
end