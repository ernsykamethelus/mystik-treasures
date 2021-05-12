class UserController < ApplicationController
   
    get '/users/new' do 
        erb :'/users/new'
    end

    post '/users' do
        user = User.new(params[:user])
        puts user
        if user.save 
            session[:user_id] = user.id
            redirect "/users/show"
        else
            redirect '/users/new'
        end
    end

     get '/users/:id' do
        user_not_logged_in
       @user = User.find_by_id(params[:user_id])
        if @user.nil? && !is_logged_in?
            redirect '/'
        elsif @user.nil? && is_logged_in?
            redirect "/users/show"
        end
    end

    get "/users" do
        user_not_logged_in
        erb :"/users/show"
    end
end



  




