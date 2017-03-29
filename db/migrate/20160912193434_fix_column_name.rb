class FixColumnName < ActiveRecord::Migration
  def self.up
    rename_column :pairs, :first_id, :word_id
  end

  def self.down
    # rename back if you need or do something else or do nothing
  end
end
