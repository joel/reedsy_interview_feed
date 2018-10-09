module ReedsyInterviewFeed
  module Services
    class Upvote
      include Wisper::Publisher

      def initialize(user:, book:)
        @user, @book = user, book
      end

      def call
        Models::Like.create({ user: user, book: book })
        broadcast(:notify, user.id, book.id)
      end

      private

      attr_reader :user, :book

    end
  end
end
