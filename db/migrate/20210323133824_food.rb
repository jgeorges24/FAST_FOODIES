class Food < ActiveRecord::Migration[6.1]
  def change
    
    create_table :foods do |t| 
      t.string :name
      t.text :description
      t.boolean :Healthy
      t.integer :price
    end




  end
end
