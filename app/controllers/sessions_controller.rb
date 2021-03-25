class SessionsController < ApplicationController

    #hanldes changing sessions 



    #login route form
    get '/login' do
        #renders login form
        erb :'sessions/new'
    
    end


    #login route post
    post '/login' do
        #take data to find user
        user = User.find_by(username: params["user"]["username"])

        #if that user is authenticated, log in, redirect /foods or home page of user
        if user && user.authenticate(params["user"]["password"])
            session["user_id"] = user.id
            redirect "/foods"

        #if user not valid, send back to /signup because authentication was bad
        else
            redirect "/login"
        end


    end


    #logout
    delete '/logout' do
    end

end