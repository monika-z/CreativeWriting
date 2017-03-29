class Post < ActiveRecord::Base
	has_many :comments, dependent: :destroy
	validates :title, presence: { message: "Tytuł nie może być pusty" }
	validates :summary, presence: { message: "Streszczenie nie może być puste" }, length: { minimum: 2, too_short: "Streszczenie musi być dłuższe"}
	validates :content, presence: { message: "Treść opowiadania nie może być pusta" }, length: { minimum: 2, too_short: "Treść opowiadania musi być dłuższa" }
	belongs_to :user
end
