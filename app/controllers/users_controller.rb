class UsersController < ApplicationController
   
    get '/users/new' do 
        erb :'/users/new'
    end

    post '/users' do
        user = User.new(params[:user])
        if user.save 
            session[:id] = user.id
            redirect "/users/#{session[:id]}"
        else
            redirect '/users/new'
        end
    end

     get '/users/:id' do
       @user = User.find_by_id(params[:id])
        if @user.nil? && !is_logged_in?
            redirect '/'
        elsif @user.nil? && is_logged_in?
            redirect "/users/#{session[:id]}"
        else
            redirect "/crystals"
        end
    end
end

#     get "/users" do
#         erb :"/users/show"
#     end
# end



  




