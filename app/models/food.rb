class Food < ActiveRecord::Base
    belongs_to :user

    #class all method
    #find/find_by
    #save
    #create
#valedation very easy 
    validates :name, :price, :description,  presence: true
end