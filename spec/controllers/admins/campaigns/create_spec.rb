require 'rails_helper'

RSpec.describe Admins::CampaignsController, type: :controller do
  include AuthHelper

  describe 'POST #create' do
    it 'should create campaign' do
      http_login
      post :create, params: { name: 'New campaign' }
      expect(response).to redirect_to(edit_admins_campaign_path(Campaign.first))
      expect(Campaign.first.name).to eq('New campaign')
    end
  end
end
