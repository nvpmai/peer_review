require 'rails_helper'

RSpec.describe Admins::CampaignsController, type: :controller do
  let(:campaign) { create(:campaign) }
  let(:user) { create(:user) }

  describe 'POST #add_user' do
    before(:each) do
      http_login
    end

    it 'should add valid user to campaign' do
      user_1 = create(:user, email: 'm@mail.com')
      campaign.users << user_1
      post :add_user, params: { id: campaign.id, email: user.email }, format: :js
      expect(assigns(:result).users).to match_array([user, user_1])
      expect(assigns(:result).campaign.id).to eq(campaign.id)
    end

    it 'should return right message for invalid user' do
      post :add_user, params: { id: campaign.id, email: 'old@mail.com' }, format: :js
      expect(assigns(:result).message).to eq('The account has not been created')
    end

    it 'should return right message for existing user' do
      campaign.users << user
      post :add_user, params: { id: campaign.id, email: user.email }, format: :js
      expect(assigns(:result).message).to eq('The user has already been added')
    end
  end
end
