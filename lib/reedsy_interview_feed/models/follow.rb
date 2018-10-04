module ReedsyInterviewFeed
  module Models
    class Follow < Base
      belongs_to :user
      belongs_to :author
    end
  end
end
