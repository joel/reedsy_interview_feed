module ReedsyInterviewFeed
  module Listeners
    class FollowAuthorNotifier
      include Base

      def notify(user_id, author_id)
        pub = publisher("user-#{user_id}")
        author = Models::Author.find(author_id)
        author.books.each { |book| pub.send(book.title) }
      end

    end
  end
end
