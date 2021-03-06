class Book < ApplicationRecord
	belongs_to :user

	validates :body, length: { in: 1..200 }
	validates :title, presence: true
	validates :body, presence: true
end
