module ReedsyInterviewFeed
  module Listeners
    class StarBookNotifier
      include Base

      def notify(user_id, book_id)
        pub = publisher("user-#{user_id}")
        book = Models::Book.find(book_id)
        pub.send(book.title)
      end

    end
  end
end
