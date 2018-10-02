module ReedsyInterviewFeed
  module Models
    class Book < Struct.new(:title, :published_on, :author)
      include Base
    end
  end
end
