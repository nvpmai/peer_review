class User < ApplicationRecord
	has_secure_password

	validates_presence_of :name
	validates_format_of :email,:with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/

	has_many :participants, dependent: :destroy
	has_many :feedbacks, dependent: :destroy
	has_many :my_feedbacks, through: :participants, source: :feedbacks
	has_and_belongs_to_many :campaigns, join_table: :participants
end
