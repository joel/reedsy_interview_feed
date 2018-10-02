module ReedsyInterviewFeed
  module Models
    class Book
      include Base
      include ReedsyInterviewModels::Entity
      attributes :title, :published_on, :author
    end
  end
end
