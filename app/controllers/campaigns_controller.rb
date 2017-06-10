class CampaignsController < ApplicationController
  before_action :require_login
  before_action :execute, except: [:index]

  def give_feedbacks
  end

  def update_feedback
  end

  def index
  end
end
