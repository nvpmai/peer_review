module Campaigns
  class UpdateFeedback < Operation
    def process
      if feedback
        feedback.update_attributes(content: params[:content])
      else
        receiver.feedbacks_to_me.create(campaign: campaign, giver_id: current_user.id, content: params[:content])
      end
      result.new('Feedback saved successfully')
    end

    private
    def campaign
      @campaign ||= Campaign.find(params[:id])
    end

    def receiver
      @receiver ||= User.find(params[:receiver_id])
    end

    def feedback
      @feedback ||= receiver.feedbacks_to_me.find_by(campaign: campaign, giver_id: current_user.id)
    end

    def result
      Struct.new(:message)
    end
  end
end
