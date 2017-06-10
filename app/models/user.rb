class User < ApplicationRecord
	has_secure_password

	validates_presence_of :name
	validates_format_of :email,:with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/

	has_many :feedbacks, dependent: :destroy, foreign_key: :giver_id
  has_many :feedbacks_to_me, dependent: :destroy, foreign_key: :receiver_id, class_name: Feedback
	has_many :campaigns, through: :participants
	has_many :participants
end
