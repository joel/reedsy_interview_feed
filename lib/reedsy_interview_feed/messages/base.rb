module ReedsyInterviewFeed
  module Messages
    module Base
      extend ActiveSupport::Concern

      def initialize
        @channel = connection.create_channel
      end

      included do
        attr_reader :channel
      end

      private

      def connection
        ReedsyInterviewFeed.configuration.connection
      end

    end
  end
end
