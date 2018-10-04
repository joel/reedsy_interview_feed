module ReedsyInterviewFeed
  module Models
    extend ActiveSupport::Autoload

    eager_autoload do
      autoload :Base
      autoload :User
      autoload :Author
      autoload :Book
      autoload :Like
      autoload :Follow
    end
  end
end
