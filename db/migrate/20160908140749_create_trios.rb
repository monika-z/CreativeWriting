class CreateTrios < ActiveRecord::Migration
  def change
    create_table :trios do |t|
      t.integer :first_id
      t.integer :second_id
      t.integer :third_id

      t.timestamps null: false
    end
  end
end
