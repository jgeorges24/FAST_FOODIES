class UsersController < ApplicationController
    
    #handles singip as well as editing or deleting a user account
    
    #signup route FORM
    get '/signup' do
        # "hello render the sign up form here"
        erb :"users/new"
    end
    
    #signup route POST to take data and generate new user
    post '/signup' do
        #takes data to make new user
        user = User.new(params["user"])
 
        #also if that user is valid redirect to /foods
        if user.save
            session["user_id"] = user.id


            #use binding pry to check if user is accurate
            #binding.pry
            
            
            
            redirect '/foods'
            #if user not valid, send back to /signup page erb
        else
            redirect '/login'
        end   
    end

    #log out method
    delete '/logout' do
        session.delete("user_id")
        redirect "/login"

        
    end

end