require 'rails_helper'

RSpec.describe Admins::CampaignsController, type: :controller do
  describe 'GET #edit' do
    it 'should return campaign and participants' do
      http_login
      campaign = create(:campaign)
      user = create(:user)
      user_1 = create(:user, email: 'm@mail.com')
      campaign.users << [user, user_1]
      get :edit, params: { id: campaign.id }
      expect(assigns(:result).campaign.name).to eq(campaign.name)
      expect(assigns(:result).users).to match_array([user, user_1])
    end
  end
end
