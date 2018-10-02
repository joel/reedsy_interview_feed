module ReedsyInterviewFeed
  module Models
    class User
      include Base
      include ReedsyInterviewModels::Entity
      attributes :name
    end
  end
end
