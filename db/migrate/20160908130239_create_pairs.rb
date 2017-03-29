class CreatePairs < ActiveRecord::Migration
  def change
    create_table :pairs do |t|
      t.integer :first_id
      t.integer :second_id
      t.integer :strength

      t.timestamps null: false
    end
  end
end
