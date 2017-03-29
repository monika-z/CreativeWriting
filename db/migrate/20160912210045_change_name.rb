class ChangeName < ActiveRecord::Migration
  def self.up
    rename_column :trios, :first_id, :word_id
    rename_column :trios, :second_id, :next_id
    rename_column :trios, :third_id, :previous_id
  end

  def self.down
    # rename back if you need or do something else or do nothing
  end
end
