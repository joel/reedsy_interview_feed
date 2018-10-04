module ReedsyInterviewFeed
  module Models
    class User < Base
      has_many :likes
      has_many :follows
    end
  end
end
