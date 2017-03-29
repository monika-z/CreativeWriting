class Comment < ActiveRecord::Base
	belongs_to :post
	belongs_to :user
	validates :comment, presence: { message: "Komentarz nie może być pusty" }, length: { minimum: 2, too_short: "KOmentarz musi być dłuższy"}

end
