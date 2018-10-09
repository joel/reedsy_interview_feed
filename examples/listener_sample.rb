ReedsyInterviewFeed.configure do |config|
  config.connection = ::Bunny.new(automatically_recover: false).tap { |c| c.start }
end

#Create an users
user = ReedsyInterviewFeed::Models::User.create({ name: 'Joel AZEMAR' })

# Create Author
author = ReedsyInterviewFeed::Models::Author.create({ name: 'Yuval Noha Harari' })

# Add a bunch of books
ReedsyInterviewFeed::Models::Book.create({ title: 'Sapiens', author: author })

# Follow this author
follow_an_author = ReedsyInterviewFeed::Services::FollowAnAuthor.new(user: user, author: author)
follow_an_author.subscribe(ReedsyInterviewFeed::Listeners::FollowAuthorNotifier.new)
follow_an_author.call

Wisper.subscribe(ReedsyInterviewFeed::Listeners::FollowAuthorNotifier.new) do
  ReedsyInterviewFeed::Services::FollowAnAuthor.new(user: user, author: author).call
end

ReedsyInterviewFeed.configure do |config|
  config.connection = ::Bunny.new(automatically_recover: false).tap { |c| c.start }
end

subscriber = ReedsyInterviewFeed::Messages::Subscriber.new('user-1')
subscriber.receive { |msg| puts(msg) }
