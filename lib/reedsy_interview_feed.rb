require "reedsy_interview_feed/version"
require "active_support/dependencies/autoload"

require 'reedsy_interview_models'

module ReedsyInterviewFeed
  extend ActiveSupport::Autoload

  autoload :Models
end
