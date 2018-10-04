module ReedsyInterviewFeed
  module Models
    class Like < Base
      belongs_to :book
      belongs_to :user
    end
  end
end
