class CreateFoodsData < ActiveRecord::Migration
  def change
    create_table :foods_data do |t|
      t.decimal :percentage

      t.belongs_to :foods
      t.belongs_to :components

      t.timestamps null: false
    end
  end
end
