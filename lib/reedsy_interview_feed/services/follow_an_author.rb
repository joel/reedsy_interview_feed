module ReedsyInterviewFeed
  module Services
    class FollowAnAuthor

      def initialize(user:, author:)
        @user, @author = user, author
      end

      def call
        Models::Follow.create({ user: user, author: author })
      end

      private

      attr_reader :user, :author

    end
  end
end
