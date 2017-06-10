require 'rails_helper'

RSpec.describe CampaignsController, type: :controller do
  let(:user) { create(:user) }
  let(:user_1) { create(:user, email: 'n@mail.com') }
  let(:user_2) { create(:user, email: 'm@mail.com') }
  let(:campaign) { create(:campaign) }

  describe 'GET #give_feedbacks' do
    it 'should return users with feedbacks' do
      login(user)
      campaign.users << [user, user_1, user_2]
      campaign.feedbacks << create(:feedback, receiver: user_1, giver: user, campaign: campaign, content: 'good')
      get :give_feedbacks, params: { id: campaign.id }
      expect(assigns(:result).users.size).to eq(2)
      expect(assigns(:result).users[0].content).to eq('good')
      expect(assigns(:result).users[1].content).to be(nil)
      expect(assigns(:result).campaign.id).to be(campaign.id)
    end
  end
end
