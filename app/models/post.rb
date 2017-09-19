class Post < ActiveRecord::Base
	has_many :comments, dependent: :destroy
	validates :title, presence: { message: I18n.t('errors.empty') }
	validates :summary, presence: { message: I18n.t('errors.empty') }, length: { minimum: 2, too_short: I18n.t('errors.length') }
	validates :content, presence: { message: I18n.t('errors.empty') }, length: { minimum: 2, too_short: I18n.t('errors.length') }
	belongs_to :user
end
