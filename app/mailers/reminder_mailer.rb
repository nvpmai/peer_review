class ReminderMailer < ApplicationMailer
  def update_feedback_email(user, campaign)
    @user = user
    @campaign  = campaign
    mail(to: @user.email, subject: "Please update your feedback for campaign #{campaign.name}")
  end
end
