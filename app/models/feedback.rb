class Feedback < ApplicationRecord
  validates_presence_of :participant_id, :user_id, :content

  belongs_to :participant
  belongs_to :user
end
