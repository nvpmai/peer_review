class Feedback < ApplicationRecord
  validates_presence_of :receiver_id, :giver_id, :campaign_id, :content

  belongs_to :campaign
  belongs_to :receiver, class_name: 'User'
  belongs_to :giver, class_name: 'User'
end
