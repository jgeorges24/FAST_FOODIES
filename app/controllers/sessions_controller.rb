class SessionsController < ApplicationController

    #hanldes changing sessions 



    #login route form
    get '/login' do
    end


    #login route post
    post '/login' do
        #take data to find user


        #if that user is authenticated, log in, redirect /foods or home page of user



        #if user not valid, send back to /signup because authentication was bad



    end


    #logout
    delete '/logout' do
    end

end