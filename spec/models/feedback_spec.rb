require 'rails_helper'

RSpec.describe Feedback, type: :model do
  describe 'properties' do
    it { should validate_presence_of(:content) }
    it { should validate_presence_of(:giver_id) }
    it { should validate_presence_of(:receiver_id) }
    it { should validate_presence_of(:campaign_id) }
  end

  describe 'associations' do
    it { should belong_to(:campaign) }
    it { should belong_to(:giver) }
    it { should belong_to(:receiver) }
  end
end
