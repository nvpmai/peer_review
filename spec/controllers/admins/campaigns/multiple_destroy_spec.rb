require 'rails_helper'

RSpec.describe Admins::CampaignsController, type: :controller do
  describe 'DELETE #multiple_destroy' do
    it 'should delete campaign' do
      http_login
      campaigns = [create(:campaign), create(:campaign)]
      post :multiple_destroy, params: { campaign_ids: [campaigns[0].id, campaigns[1].id] }, format: :js
      expect(Campaign.count).to eq(0)
    end
  end
end
