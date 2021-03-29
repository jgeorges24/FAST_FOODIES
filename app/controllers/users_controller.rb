class UsersController < ApplicationController
    
    #handles singip as well as editing or deleting a user account
    
    #signup route FORM
    get '/signup' do
        redirect_logged_in
        # "hello render the sign up form here"
        erb :"users/new"
    end
    
    #signup route POST to take data and generate new user
    post '/signup' do
        #takes data to make new user
        redirect_logged_in
        user = User.new(params["user"])
 
        #also if that user is valid redirect to /foods
        if user.save

            session["user_id"] = user.id
            #use binding pry to check if user is accurate
            #binding.pry
            
            redirect '/foods'
            #if user not valid, send back to /signup page erb
        else
            #"Error #{food.errors.full_messages.join(", ")}"
            redirect '/login'

        end   
    end

    #log out method
    delete '/logout' do
        
        session.delete("user_id")
        redirect "/login"

        
    end


    #account information route

    get '/user' do
        redirect_not_logged
        xuser
        @current_user ||= User.find_by_id(session["user_id"])
            erb :account
    end

end