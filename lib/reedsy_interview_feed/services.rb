module ReedsyInterviewFeed
  module Services
    extend ActiveSupport::Autoload

    eager_autoload do
      autoload :Upvote
      autoload :FollowAnAuthor
    end
  end
end
