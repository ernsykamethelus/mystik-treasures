class SessionsController < ApplicationController

    get '/login' do
        erb :'/login'
    end

    post '/login' do 
        binding.pry
        chosen_user = User.find_by(:username => params[:username])
        if chosen_user && chosen_user.authenticate(params[:password])
            session[:id] = chosen_user.id 
            erb :'/users/show'
        else 
            erb :'/login'
        end
    end

get '/logout' do 
    session.clear 
    redirect '/'
  end
end