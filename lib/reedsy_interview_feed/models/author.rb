module ReedsyInterviewFeed
  module Models
    class Author
      include Base
      include ReedsyInterviewModels::Entity
      attributes :name
    end
  end
end
