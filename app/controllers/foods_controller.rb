class FoodsController < ApplicationController

    #read all foods
    get '/foods' do
        # @food = current_user.foods
        #redirect "/login" if !logged_in?
        @foods = Food.all
        erb :'foods/index'
    end

    #create new food (render form)

    get '/foods/new' do

        #redirect "/login" if !logged_in?
        erb :'foods/new'
    end

    #read one food

    get '/foods/:id' do
        @food = Food.find_by_id(params[:id])
        erb :'foods/show'
    end


    #create new food (save in db)
    post '/foods' do
        food = Food.new(params["food"])
        
        #food = current_user.foods.build(params["food"])

        if food.save
            redirect "/foods/#{food.id}"
        else
            "Error #{food.errors.full_messages.join(", ")}"
        end

    end

    #update 1 food (render form)
    get '/foods/:id/edit' do
        @food = Food.find_by_id(params[:id])
        erb :'food/edit'
    end


    #update 1 food (save in db)
    patch '/foods/:id' do
        food = Food.find_by_id(params[:id])

        if food.update(params["food"])
            redirect "/foods/#{food.id}"
        else
            redirect "/foods/#{food.id}/edit"
        end
    end

    #delete 1 food 

    delete "/foods/:id" do
        redirect "/login" if !logged_in?
        food = Food.find_by_id(params[:id])
        food.destroy
        redirect "/foods"
    end




    private

    def redirect_not_auth
        @food = Food.find_by_id(params[:id])
        if @food.user_id != session["user_id"]
            redirect "/foods"
        end
    end 

end