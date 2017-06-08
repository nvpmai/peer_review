class Participant < ApplicationRecord
	belongs_to :user
	belongs_to :campaign

	has_many :feedbacks, dependent: :destroy
end
