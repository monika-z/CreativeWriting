class Pair < ActiveRecord::Base
	belongs_to :word
	belongs_to :second, :class_name => "Word"
	before_save :default_values
	validates :second_id, presence: { message: I18n.t('errors.empty') }
  	
  	def default_values
   		 self.strength ||= 0
  	end
  	
end
