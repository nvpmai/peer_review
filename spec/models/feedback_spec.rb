require 'rails_helper'

RSpec.describe Feedback, type: :model do
  describe 'properties' do
    it { should validate_presence_of(:content) }
    it { should validate_presence_of(:participant_id) }
    it { should validate_presence_of(:user_id) }
  end

  describe 'associations' do
    it { should belong_to(:user) }
    it { should belong_to(:participant) }
  end
end
