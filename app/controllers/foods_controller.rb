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
end

#update 1 food (render form)

#update 1 food (save in db)

#delete 1 food 




end