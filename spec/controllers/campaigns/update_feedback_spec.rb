require 'rails_helper'

RSpec.describe CampaignsController, type: :controller do
  let(:user) { create(:user) }
  let(:user_1) { create(:user, email: 'n@mail.com') }
  let(:user_2) { create(:user, email: 'm@mail.com') }
  let(:campaign) { create(:campaign) }

  describe 'POST #update_feedback' do
    before(:each) do
      login(user)
      campaign.users << [user, user_1, user_2]
    end

    it 'should create feedback' do
      post :update_feedback, params: { id: campaign.id, receiver_id: user_1.id, content: 'good' }, format: :js
      expect(assigns(:result).message).to eq('Feedback saved successfully')
      expect(user_1.feedbacks_to_me.find_by(campaign: campaign, giver_id: user.id).content).to eq('good')
    end

    it 'should update feedback' do
      user_1.feedbacks_to_me.create(giver: user, campaign: campaign)
      post :update_feedback, params: { id: campaign.id, receiver_id: user_1.id, content: 'good' }, format: :js
      expect(assigns(:result).message).to eq('Feedback saved successfully')
      expect(user_1.feedbacks_to_me.find_by(campaign: campaign, giver_id: user.id).content).to eq('good')
    end
  end
end
