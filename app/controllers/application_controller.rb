
class ApplicationController < Sinatra::Base
    #set :views, Proc.new { File.join(root, "../views") }

    configure do
        set :views, 'app/views'
        set :public_folder, 'public'
        enable :sessions
        set :session_secret, ENV['SESSION_SECRET']

    end

    #should be home page
    get '/' do
        redirect_not_logged
        @foods = current_user.foods
        xuser
        find_food
        erb :welcome
    end
    


    # HELPER METHODS BELOW
    helpers do
        def current_user
            @current_user ||= User.find_by_id(session["user_id"])
        end

        #helper method for user name to display in nave bar
        def xuser
            @user= current_user

        end


        def logged_in?
            !!current_user
        end

        def find_food
            @fd = Food.find_by_id(params[:id])
        end
        #IF NOT LOGGED IN
        def redirect_not_logged

            redirect "/login" if !logged_in?
            #the user is not logged in
        end

        #if LOGGED IN user cannot do things like signup again or login again...
        def redirect_logged_in

            redirect "/foods" if !!logged_in?
            #which means the user is logged in

        end
    end
end