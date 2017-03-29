class Word < ActiveRecord::Base
	has_many :pairs, dependent: :destroy
	has_many :seconds, through: :pairs
	has_many :trios, dependent: :destroy
	has_many :nexts, through: :trios
	has_many :previouses, through: :trios
	validates :content, presence: { message: "Słowo nie może być puste" }, length: { minimum: 2, too_short: "Słowo musi być dłuższe"}, uniqueness: {message: "To słowo już istnieje"}

end
