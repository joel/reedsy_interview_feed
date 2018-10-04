module ReedsyInterviewFeed
  module Models
    class Book < Base
      belongs_to :author
      has_many :likes
    end
  end
end
