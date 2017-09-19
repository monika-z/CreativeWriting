class Trio < ActiveRecord::Base
 belongs_to :word, :class_name => "Word"
 belongs_to :next, :class_name => "Word"
 belongs_to :previous, :class_name => "Word"
 
end
