# ReedsyInterviewFeed

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/reedsy_interview_feed`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'reedsy_interview_feed'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install reedsy_interview_feed

## Usage

![Screenshot](https://user-images.githubusercontent.com/5789/46665539-7282bf80-cbc4-11e8-9a3e-11ed5cce2588.gif)

```ruby
# Start RabbitMQ
docker-compose up

# Open an terminal
bin/console

# Open a connection to RabbitMQ
ReedsyInterviewFeed.configure do |config|
  config.connection = ::Bunny.new(automatically_recover: false).tap { |c| c.start }
end

# Open the Feed for a specific user
user = OpenStruct.new({ id: 1 })

# Get the feed of the user
feed = ReedsyInterviewFeed::Services::Feed.new(user)

# Watch the feed
feed.watch

# Open another terminal session
bin/console

# Open a connection to RabbitMQ
ReedsyInterviewFeed.configure do |config|
  config.connection = ::Bunny.new(automatically_recover: false).tap { |c| c.start }
end

# Create an user
user = ReedsyInterviewFeed::Models::User.create({ name: 'Joel AZEMAR' })

# Create Author
author = ReedsyInterviewFeed::Models::Author.create({ name: 'Yuval Noha Harari' })

# Add a bunch of books
ReedsyInterviewFeed::Models::Book.create({ title: 'Sapiens', author: author })
ReedsyInterviewFeed::Models::Book.create({ title: 'Homo Deus', author: author })
ReedsyInterviewFeed::Models::Book.create({ title: '21 Lessons for the 21st Century', author: author })

# Follow this author
Wisper.subscribe(ReedsyInterviewFeed::Listeners::FollowAuthorNotifier.new) do
  ReedsyInterviewFeed::Services::FollowAnAuthor.new(user: user, author: author).call
end
# On the first terminal session you can see the books show up on the feed

# Add another book and star it
book = ReedsyInterviewFeed::Models::Book.create({ title: 'Alan Turing: The Enigma' })

Wisper.subscribe(ReedsyInterviewFeed::Listeners::StarBookNotifier.new) do
  ReedsyInterviewFeed::Services::Upvote.new(user: user, book: book).call
end
# On the first terminal session you can see the books show up on the feed
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/reedsy_interview_feed. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the ReedsyInterviewFeed project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/reedsy_interview_feed/blob/master/CODE_OF_CONDUCT.md).
