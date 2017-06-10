module Campaigns
  class GiveFeedbacks < Operation
    def process
      result.new(users, campaign)
    end

    private
    def campaign
      @campaign ||= Campaign.find(params[:id])
    end

    def users
      User.joins('LEFT JOIN feedbacks ON feedbacks.receiver_id = users.id')
          .joins(:participants).where('participants.campaign_id = ? AND users.id != ?', campaign.id, current_user.id)
          .select('users.id, users.email, users.name, feedbacks.content')
    end

    def result
      Struct.new(:users, :campaign)
    end
  end
end
