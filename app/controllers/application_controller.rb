require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions 
    # register Sinatra::Flash
    set :session_secret, "secret"
  end

  get "/" do
      if is_logged_in?
        redirect "/users/#{session[:id]}"
      else
        erb :home
  end
end


  def current_user 
    user = User.find_by_id(session[:id])
   end

  def is_logged_in?
    !!current_user
  end

  def user_not_logged_in
    if !is_logged_in?
      redirect '/login'
     end
  end
end
