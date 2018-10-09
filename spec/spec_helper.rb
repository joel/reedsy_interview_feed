require "bundler/setup"
require "reedsy_interview_feed"

require 'pry'
require 'bunny-mock'

ENV['ADAPTER'] ||= 'active_record'

load File.dirname(__FILE__) + "/support/adapters/#{ENV['ADAPTER']}.rb"

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  config.before(:each) do
    ReedsyInterviewFeed.configuration.connection = BunnyMock.new.start
  end
end
