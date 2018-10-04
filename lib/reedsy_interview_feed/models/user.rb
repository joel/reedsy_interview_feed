module ReedsyInterviewFeed
  module Models
    class User < Base
      has_many :likes
    end
  end
end
