module ReedsyInterviewFeed
  module Services
    extend ActiveSupport::Autoload

    eager_autoload do
      autoload :Upvote
      autoload :FollowAnAuthor
      autoload :Feed
    end
  end
end
