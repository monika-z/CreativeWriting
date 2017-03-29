class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
				 
	has_many :posts
	validates :username, presence: { message: "Nazwa użytkownika nie może być pusta" }, uniqueness: {message: "Ta nazwa użytkownika jest już zajęta"}, length: { minimum: 2, too_short: "Nazwa użytkownika musi być dłuższa" }
end
