require 'rails_helper'

RSpec.describe Admins::CampaignsController, type: :controller do
  describe 'GET #index' do
    it 'should return campaigns' do
      http_login
      campaigns = [create(:campaign), create(:campaign)]
      get :index
      expect(assigns(:result).size).to eq(campaigns.size)
      expect(assigns(:result)).to include(campaigns[0])
      expect(assigns(:result)).to include(campaigns[1])
    end
  end
end
