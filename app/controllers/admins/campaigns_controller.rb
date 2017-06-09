module Admins
  class CampaignsController < BaseController
    before_action :execute, except: [:create, :multiple_destroy]

    def index
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
  end
end
