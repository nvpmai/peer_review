module Admins
  module Campaigns
    class Update < Operation
      def process
        campaign.assign_attributes(campaign_params)
        if campaign.save
          result.new('Update campaign successfully')
        end
      end

      private
      def campaign
        @campaign ||= Campaign.find(params[:id])
      end

      def campaign_params
        params.require(:campaign).permit(:name)
      end

      def result
        Struct.new(:message)
      end
    end
  end
end
