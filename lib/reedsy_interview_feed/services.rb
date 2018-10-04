module ReedsyInterviewFeed
  module Services
    extend ActiveSupport::Autoload

    eager_autoload do
      autoload :Upvote
    end
  end
end
