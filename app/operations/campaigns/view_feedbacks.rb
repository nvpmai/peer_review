module Campaigns
  class ViewFeedbacks < Operation
    def process
      result.new(users, campaign)
    end

    private
    def campaign
      @campaign ||= Campaign.find(params[:id])
    end

    def users
      User.joins('LEFT JOIN feedbacks ON feedbacks.giver_id = users.id')
          .joins(:participants).where('participants.campaign_id = ? AND feedbacks.receiver_id = ?', campaign.id, current_user.id)
          .select('users.id, users.email, users.name, feedbacks.content')
    end

    def result
      Struct.new(:users, :campaign)
    end
  end
end
