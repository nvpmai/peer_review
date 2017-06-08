class Campaign < ApplicationRecord
	validates_presence_of :name

	has_and_belongs_to_many :users, join_table: :participants
end
