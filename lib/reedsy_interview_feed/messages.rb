module ReedsyInterviewFeed
  module Messages
    extend ActiveSupport::Autoload

    eager_autoload do
      autoload :Base
      autoload :Publisher
      autoload :Subscriber
    end
  end
end
