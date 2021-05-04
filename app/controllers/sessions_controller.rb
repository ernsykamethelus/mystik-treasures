class SessionsController < ApplicationController

    get '/login' do
        erb :'/login'
    end

    post '/login' do 
        @current_user = User.find_by(:username => params[:username])
        if @current_user && @current_user.authenticate(params[:password])
            session[:id] = @current_user.id 
            erb :"/users/show"
        else 
            redirect :'/login'
        end
    end

get '/logout' do 
    session.clear 
    redirect '/'
  end
end