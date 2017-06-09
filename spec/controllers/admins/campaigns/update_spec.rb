require 'rails_helper'

RSpec.describe Admins::CampaignsController, type: :controller do
  include AuthHelper

  describe 'PUT #update' do
    it 'should update campaign' do
      http_login
      campaign = create(:campaign)
      post :update, params: { id: campaign.id, campaign: { name: 'new_name'} }, format: :js
      expect(assigns(:result).message).to eq('Update campaign successfully')
      expect(campaign.reload.name).to eq('new_name')
    end
  end
end
