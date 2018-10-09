module ReedsyInterviewFeed
  module Services
    class Feed
      include Listeners::Base

      def initialize(user)
        @user = user
        @feed = []
        @queue_name = "user-#{user.id}"
        @pub = publisher(@queue_name)
      end

      def watch
        Messages::Subscriber.new(@queue_name).receive do |title|
          record(title)
          repaint!
        end
      end

      def retrieve
        data.map(&:title).each do |book_title|
          @pub.send(book_title)
          record(book_title)
        end
      end

      private

      def repaint!
        @feed.reverse.each_with_index do |entry, index|
          puts("#{index}:\t#{entry}")
        end
      end

      def data
        author_ids = @user.follows.select(:author_id)
        book_ids   = @user.likes.select(:book_id)
        Models::Book.where(author_id: author_ids).or(Models::Book.where(id: book_ids))
      end

      def record(title)
        @feed << title
        nil
      end

    end
  end
end
