module Admins
  module Campaigns
    class Index < Operation
      def process
        @campaigns = Campaign.where('name ILIKE ?', "%#{params[:term]}%").order(created_at: :desc).page(params[:page]).per(15)
      end
    end
  end
end
