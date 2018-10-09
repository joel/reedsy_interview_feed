module ReedsyInterviewFeed
  module Services
    class FollowAnAuthor
      include Wisper::Publisher

      def initialize(user:, author:)
        @user, @author = user, author
      end

      def call
        Models::Follow.create({ user: user, author: author })
        broadcast(:notify, user.id, author.id)
      end

      private

      attr_reader :user, :author

    end
  end
end
