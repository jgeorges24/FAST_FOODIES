
class ApplicationController < Sinatra::Base
    set :views, Proc.new { File.join(root, "../views") }

    configure do
        set :views, 'app/views'
        set :public_folder, 'public'
        enable :sessions
        set :session_secret, ENV['SESSION_SECRET']

    end

    get '/' do
        "home page"
        

        
    end


    


end