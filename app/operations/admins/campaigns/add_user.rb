module Admins
  module Campaigns
    class AddUser < Operation
      def process
        if user
          if campaign.users.include?(user)
            result.new(nil, nil, 'The user has already been added')
          else
            campaign.users << user
            result.new(campaign, campaign.users, nil)
          end
        else
          result.new(nil, nil, 'The account has not been created')
        end
      end

      private
      def campaign
        @campaign ||= Campaign.find(params[:id])
      end

      def user
        @user ||= User.find_by(email: params[:email])
      end

      def result
        Struct.new(:campaign, :users, :message)
      end
    end
  end
end
