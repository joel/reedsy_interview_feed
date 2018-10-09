require "reedsy_interview_feed/version"
require "active_support/dependencies/autoload"
require 'wisper'

module ReedsyInterviewFeed
  extend ActiveSupport::Autoload

  autoload :Models
  autoload :Services
  autoload :Configuration
  autoload :Messages
  autoload :Listeners
  autoload :Utils

  class << self
    attr_writer :configuration
  end

  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.configure
    yield(configuration)
  end
end
