module Admins
  module Campaigns
    class SendReminder < Operation
      def process
        send_mail
        result.new('Mails have been sent to all participants')
      end

      private
      def campaign
        @campaign ||= Campaign.find(params[:id])
      end

      def result
        Struct.new(:message)
      end

      def send_mail
        campaign.users.each do |user|
          ReminderMailer.update_feedback_email(user, campaign).deliver_later unless user.is_fake
        end
      end
    end
  end
end
