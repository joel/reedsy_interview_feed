source "https://rubygems.org"

git_source(:github) {|repo_name| "https://github.com/#{repo_name}" }

# Specify your gem's dependencies in reedsy_interview_feed.gemspec
gemspec

gem 'activesupport'
gem 'activerecord'
gem 'bunny'
gem 'wisper'

ENV['ADAPTER'] ||= 'active_record'

group :test do
  gem 'pry'
  gem 'bunny-mock'
  gem 'wisper-rspec'
  case ENV['ADAPTER']
  when nil, 'active_record'
    gem 'sqlite3', platform: 'ruby'
  else
    raise "Unknown model adapter: #{ENV['ADAPTER']}"
  end
end
