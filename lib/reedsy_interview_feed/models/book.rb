module ReedsyInterviewFeed
  module Models
    class Book < Base
      belongs_to :author
    end
  end
end
