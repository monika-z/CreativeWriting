class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
				 
	has_many :posts
	validates :username, presence: { message: I18n.t('errors.empty') }, uniqueness: {message: I18n.t('errors.unique')}, length: { minimum: 2, too_short: I18n.t('errors.length') }
end
