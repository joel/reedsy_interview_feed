module ReedsyInterviewFeed
  module Services
    class Feed

      def initialize(user)
        @user = user
      end

      def retrieve
        author_ids = @user.follows.select(:author_id)
        book_ids   = @user.likes.select(:book_id)
        Models::Book.where(author_id: author_ids).or(Models::Book.where(id: book_ids))
      end

    end
  end
end
