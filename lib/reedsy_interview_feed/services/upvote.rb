module ReedsyInterviewFeed
  module Services
    class Upvote

      def initialize(user:, book:)
        @user, @book = user, book
      end

      def call
        Models::Like.create({ user: user, book: book })
      end

      private

      attr_reader :user, :book

    end
  end
end
