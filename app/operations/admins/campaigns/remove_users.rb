module Admins
  module Campaigns
    class RemoveUsers < Operation
      def process
        if params[:user_ids].present?
          campaign.users.delete(*params[:user_ids])
        end
        result.new(campaign, campaign.users)
      end

      private
      def campaign
        @campaign ||= Campaign.find(params[:id])
      end

      def result
        Struct.new(:campaign, :users)
      end
    end
  end
end
