class User < ActiveRecord::Base
    has_many :foods
    has_secure_password

#foods returns all the foods 
# foods<< save to database
# foods.delete(food obj)
#foods.destroy(food obj)
#foods= [food objs]
    validates :username, uniqueness: true, presence: true
end