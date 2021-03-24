class User < ActiveRecord::Base
has_many :foods

#foods returns all the foods 
# foods<< save to database
# foods.delete(food obj)
#foods.destroy(food obj)
#foods= [food objs]

end