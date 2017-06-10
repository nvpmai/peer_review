class Campaign < ApplicationRecord
	validates_presence_of :name

	has_many :users, -> { order('participants.created_at desc') }, through: :participants
	has_many :participants, dependent: :destroy
	has_many :feedbacks, dependent: :destroy
end
