module ReedsyInterviewFeed
  module Models
    class Author < Base
      has_many :books
    end
  end
end
