class SessionsController < ApplicationController

    get '/login' do
        erb :'/login'
    end

    post "/login" do
        @user = User.find_by(:username => params[:username])
        if @user && @user.authenticate(params[:password])
            # binding.pry
          session[:user_id] = @user.id
          puts "Hello, #{session[:user_id]}"
        #   erb :"/users/welcome"
        # erb :"/users/#{session[:id]}" 
          erb :"/users/welcome"
        else
          redirect "/error"
        end
      end 


get '/logout' do 
    session.clear 
    redirect '/'
  end
end
