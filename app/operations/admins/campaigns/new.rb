module Admins
  module Campaigns
    class New < Operation
      def process
        result.new(Campaign.new)
      end

      private
      def result
        Struct.new(:campaign)
      end
    end
  end
end
