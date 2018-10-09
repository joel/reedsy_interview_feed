module ReedsyInterviewFeed
  module Listeners
    module Base

      private

      def publisher(queue_name)
        ReedsyInterviewFeed::Messages::Publisher.new(queue_name)
      end
    end
  end
end
