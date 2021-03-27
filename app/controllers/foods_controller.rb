class FoodsController < ApplicationController


    #read current user foods
    get '/foods' do
        
        redirect_not_logged
        #helper method
        @foods = current_user.foods
       
        erb :'foods/index'
    end

    #create new food (render form)
    get '/foods/new' do
        redirect_not_logged

        redirect "/login" if !logged_in?
        erb :'foods/new'
    end

    #read one food
    get '/foods/:id' do
        redirect_not_logged
        @food = Food.find_by_id(params[:id])
        erb :'foods/show'
    end


    #create new food (save in db)
    post '/foods' do
        #binding.pry
        redirect_not_logged

        #food = Food.new(params["food"])
        
        food = current_user.foods.build(params["food"])

        if food.save
            redirect "/foods/#{food.id}"

        else
            "Error #{food.errors.full_messages.join(", ")}"
    
        end

    end

    #update 1 food (render form)
    get '/foods/:id/edit' do
        redirect_not_logged
        @food = Food.find_by_id(params[:id])
        erb :'foods/edit'
    end


    #update 1 food (save in db)
    patch '/foods/:id' do
        redirect_not_logged
        food = Food.find_by_id(params[:id])

        if food.update(params["food"])
            redirect "/foods/#{food.id}"
        else
            redirect "/foods/#{food.id}/edit"
        end
    end

    #delete 1 food 

    delete '/foods/:id' do

        redirect_not_logged
        
        food = Food.find_by_id(params[:id])
        food.destroy
        redirect "/foods"
    end

    post '/search' do
        redirect_not_logged
        @food = Food.find_by(name: params["name"]) 
        
        redirect "/foods/#{@food.id}"
    end

    get "/iconpage" do


        erb :iconpage
    end


    private

    def redirect_not_auth
        @food = Food.find_by_id(params[:id])
        if @food.user_id != session["user_id"]
            redirect "/foods"
        end
    end 

end