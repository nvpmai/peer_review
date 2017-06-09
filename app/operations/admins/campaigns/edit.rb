module Admins
  module Campaigns
    class Edit < Operation
      def process
        result.new(campaign, campaign.users.order(created_at: :desc))
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
