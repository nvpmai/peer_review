require 'rails_helper'

RSpec.describe Admins::CampaignsController, type: :controller do
  describe 'POST #close' do
    it 'should close campaign' do
      http_login
      campaign = create(:campaign)
      post :close, params: { id: campaign.id }, format: :js
      expect(assigns(:result).campaign.is_open).to be(false)
    end
  end
end
