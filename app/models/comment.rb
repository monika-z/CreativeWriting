class Comment < ActiveRecord::Base
	belongs_to :post
	belongs_to :user
	validates :comment, presence: { message: I18n.t('errors.empty') }, length: { minimum: 2, too_short: I18n.t('errors.length')}

end
