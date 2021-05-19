class UserController < ApplicationController
   
    get '/users/new' do 
        erb :'/users/new'
    end

    post '/users' do
        user = User.new(params[:user])
        puts user
        if user.save 
            session[:id] = user.id
            redirect "/users/#{session[:id]}"
        else
            redirect '/users/new'
        end
    end

     get '/users/:id' do
        user_not_logged_in
       @user = User.find_by_id(params[:id])
        if @user.nil? 
            redirect '/'
        else
            erb :"/users/welcome"
        end
    end

    get "/users" do
        user_not_logged_in
        erb :"/users/welcome"
    end
end



