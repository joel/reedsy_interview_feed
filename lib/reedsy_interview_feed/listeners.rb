module ReedsyInterviewFeed
  module Listeners
    extend ActiveSupport::Autoload

    eager_autoload do
      autoload :Base
      autoload :FollowAuthorNotifier
      autoload :StarBookNotifier
    end
  end
end
