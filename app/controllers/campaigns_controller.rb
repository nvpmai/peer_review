class CampaignsController < ApplicationController
  before_action :require_login
  before_action :authorize, only: [:give_feedbacks, :update_feedback]
  before_action :execute, except: [:index]

  def give_feedbacks
  end

  def update_feedback
  end

  def index
  end

  private

  def campaign
    @campaign ||= Campaign.find(params[:id])
  end

  def authorize
    redirect_to root_path unless campaign.users.include?(current_user)
  end
end
