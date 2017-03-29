class Pair < ActiveRecord::Base
	belongs_to :word
	belongs_to :second, :class_name => "Word"
	before_save :default_values
	validates :second_id, presence: { message: "Nie może być puste" }
  	def default_values
   		 self.strength ||= 0
  	end
end
