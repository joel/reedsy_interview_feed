module ReedsyInterviewFeed
  module Messages
    class Subscriber
      include Base

      def initialize(queue_name)
        super()
        @queue = channel.queue(queue_name)
      end

      def receive(&block)
        begin
          queue.subscribe(block: true) do |_delivery_info, _properties, body|
            yield(body)
          end
        rescue Interrupt
          connection.close
          exit(0)
        end
      end

      private

      attr_reader :queue

    end
  end
end
