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
Wisper.subscribe(ReedsyInterviewFeed::Listeners::FollowAuthorNotifier.new) do
  ReedsyInterviewFeed::Services::FollowAnAuthor.new(user: user, author: author).call
end

book = ReedsyInterviewFeed::Models::Book.create({ title: 'Alan Turing: The Enigma' })

Wisper.subscribe(ReedsyInterviewFeed::Listeners::StarBookNotifier.new) do
  ReedsyInterviewFeed::Services::Upvote.new(user: user, book: book).call
end

# ========================================================

ReedsyInterviewFeed.configure do |config|
  config.connection = ::Bunny.new(automatically_recover: false).tap { |c| c.start }
end

#Create an users
user = ReedsyInterviewFeed::Models::User.where({ name: 'Joel AZEMAR' }).take # Memory doesn't share across thread.
user = OpenStruct.new({ id: 1 })

# Get the feed of the user
feed = ReedsyInterviewFeed::Services::Feed.new(user)

# Get the title of the following books
# feed.retrieve
feed.watch
