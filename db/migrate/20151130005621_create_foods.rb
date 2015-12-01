class CreateFoods < ActiveRecord::Migration
  def change
    create_table :foods do |t|
      t.string :name, :unique => true
      t.text :description
      t.text :properties



      t.timestamps null: false
    end
  end
end
