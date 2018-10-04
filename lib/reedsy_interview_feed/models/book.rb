module ReedsyInterviewFeed
  module Models
    class Book < Base
      belongs_to :author
      has_many :likes
      has_many :follows
    end
  end
end
