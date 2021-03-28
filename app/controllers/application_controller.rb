
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
        find_food
        erb :welcome
    end
    
    helpers do
        def current_user
            @current_user ||= User.find_by_id(session["user_id"])
        end

        def logged_in?
            !!current_user
        end

        def find_food
            @fd = Food.find_by_id(params[:id])
        end

        def redirect_not_logged

            redirect "/login" if !logged_in?
        end
    end
end