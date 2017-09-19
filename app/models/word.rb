class Word < ActiveRecord::Base
	has_many :pairs, dependent: :destroy
	has_many :seconds, through: :pairs
	has_many :trios, dependent: :destroy
	has_many :nexts, through: :trios
	has_many :previouses, through: :trios
	validates :content, presence: { message: I18n.t('errors.empty') }, length: { minimum: 2, too_short: I18n.t('errors.length') }, uniqueness: {message: I18n.t('errors.unique')}

end
