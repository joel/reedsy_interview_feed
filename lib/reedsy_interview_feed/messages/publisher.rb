module ReedsyInterviewFeed
  module Messages
    class Publisher
      include Base

      def initialize(queue_name)
        super()
        @queue = channel.queue(queue_name)
      end

      def send(msg)
        queue.publish(msg, persistent: true)
      end

      private

      attr_reader :queue

    end
  end
end
