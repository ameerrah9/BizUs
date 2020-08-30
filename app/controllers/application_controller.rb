require './config/environment'

class ApplicationController < Sinatra::Base

  before { redirect_if_not_logged_in? }

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    register Sinatra::Flash # enables sinatra-flash
    # environment variable protects session secret
    set :session_secret, ENV['SESSION_SECRET']
  end

  get "/" do
    erb :welcome
  end

  helpers do

    def logged_in?
      !!current_user
    end
  
    def current_user
      @current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]
      # uses memoization to prevent duplicate database queries
    end

    def redirect_if_not_logged_in?
      if !logged_in?
        redirect to '/login'
      end
    end
  
  end

end