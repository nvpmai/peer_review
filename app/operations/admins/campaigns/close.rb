module Admins
  module Campaigns
    class Close < Operation
      def process
        campaign.update_attributes(is_open: false)
        result.new(campaign)
      end

      private
      def campaign
        @campaign ||= Campaign.find(params[:id])
      end

      def result
        Struct.new(:campaign)
      end
    end
  end
end
