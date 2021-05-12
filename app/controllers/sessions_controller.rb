class SessionsController < ApplicationController

    get '/login' do
        erb :'/login'
    end

    post '/login' do 
        @user = User.find_by(:username => params[:username])
        if @user && @user.authenticate(params[:password])
            session[:id] = @user.id 
            redirect "/users/show"
        else 
            redirect '/login'
        end
    end

get '/logout' do 
    session.clear 
    redirect '/'
  end
end

# class SessionsController < ApplicationController

#     get '/login' do
#         erb :'/login'
#     end

#     post '/login' do 
#         @user = User.find_by_username(params[:username])
#         if @user && @user.authenticate(params[:password])
#             session[:user_id] = @user.id 
#             # redirect "/users/show"
#             erb :"/users/#{session[:id]}" 
#         else 
#             redirect '/login'
#         end
#     end

# get '/logout' do 
#     session.clear 
#     redirect '/'
#   end
# end