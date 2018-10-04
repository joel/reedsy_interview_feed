require "reedsy_interview_feed/version"
require "active_support/dependencies/autoload"

module ReedsyInterviewFeed
  extend ActiveSupport::Autoload

  autoload :Models
  autoload :Services
end
