class CreateReferences < ActiveRecord::Migration[6.1]
  def change
    add_reference :foods, :user, foreign_key: true
  end
end
