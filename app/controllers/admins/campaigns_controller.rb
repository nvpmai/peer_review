module Admins
  class CampaignsController < BaseController
    before_action :require_open, only: [:edit, :update, :add_user, :remove_users, :close, :send_reminder]
    before_action :execute, except: [:create, :multiple_destroy, :show]

    def index
    end

    def show
      campaign
    end

    def create
      campaign ||= Campaign.new(name: params[:name])
      if campaign.save
        redirect_to edit_admins_campaign_path(campaign)
      end
    end

    def edit
    end

    def update
    end

    def add_user
    end

    def multiple_destroy
      respond_to do |format|
        if params[:campaign_ids].present?
          Campaign.where(id: params[:campaign_ids]).destroy_all
          flash[:success] = 'Delete campaigns successfully!'
        end
        format.js
      end
    end

    def remove_users
    end

    def close
    end

    def send_reminder
    end

    private
    def campaign
      @campaign ||= Campaign.find(params[:id])
    end

    def require_open
      redirect_to admins_campaign_path(campaign) unless campaign.is_open
    end
  end
end
