class User < ApplicationRecord
	has_secure_password

	validates_presence_of :name
	validates_format_of :email,:with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/

	has_many :feedbacks, dependent: :destroy
	has_many :my_feedbacks, through: :participants, source: :feedbacks
	has_many :campaigns, through: :participants
	has_many :participants
end
