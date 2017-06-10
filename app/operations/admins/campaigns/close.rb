module Admins
  module Campaigns
    class Close < Operation
      def process
        campaign.update_attributes(is_open: false)
        send_mail
        result.new(campaign, 'Mails have been sent to all participants')
      end

      private
      def campaign
        @campaign ||= Campaign.find(params[:id])
      end

      def result
        Struct.new(:campaign, :message)
      end

      def send_mail
        campaign.users.each do |user|
          ReminderMailer.view_feedback_email(user, campaign).deliver_later unless user.is_fake
        end
      end
    end
  end
end
