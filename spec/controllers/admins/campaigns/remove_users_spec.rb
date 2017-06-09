require 'rails_helper'

RSpec.describe Admins::CampaignsController, type: :controller do
  include AuthHelper

  let(:campaign) { create(:campaign) }
  let(:user) { create(:user) }
  let(:user_1) { create(:user, email: 'm@mail.com') }

  describe 'DELETE #remove_users' do
    it 'should remove users from campaign' do
      http_login
      campaign.users << [user_1, user]
      delete :remove_users, params: { id: campaign.id, user_ids: [user.id, user_1.id] }, format: :js
      expect(assigns(:result).users).to match_array([])
    end
  end
end
