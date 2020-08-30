class UsersController < ApplicationController

    get ('/signup') { erb :'users/signup' }

    post '/signup' do
        # validation on controller for data coming from signup form
        # it's better if you choose either controller or model validations and be consistent
        if params[:username].empty? || params[:email].empty?
            @error = "All fields must be completed" # sending string as custom error message
            erb :'users/signup'
        else
            user = User.create(params)
            session[:user_id] = user.id
            redirect '/biz_plans'
        end
        
    end

    get ('/login') { erb :'users/login' }

    post '/login' do
        @user = User.find_by(username: params[:username])
        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
           redirect '/biz_plans'
        else
            # using sinatra-flash to send flash error message
            # it's best to be as consistent as possible in how you choose to handle error messaging
            # (error messaging is bonus, not required)
            flash[:error] = "Invalid credentials. Try again!"
            redirect '/login'
        end
    end

    get '/logout' do
        session.clear
        redirect '/'
    end
    
end