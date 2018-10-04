#Create an users
user = ReedsyInterviewFeed::Models::User.create({ name: 'Joel AZEMAR' })

# Create Author
author = ReedsyInterviewFeed::Models::Author.create({ name: 'Yuval Noha Harari' })

# Add a bunch of books
ReedsyInterviewFeed::Models::Book.create({ title: 'Sapiens', author: author })
ReedsyInterviewFeed::Models::Book.create({ title: 'Homo Deus', author: author })
ReedsyInterviewFeed::Models::Book.create({ title: '21 Lessons for the 21st Century', author: author })

# Follow this author
ReedsyInterviewFeed::Services::FollowAnAuthor.new(user: user, author: author).call

# Add another book and star it
book = ReedsyInterviewFeed::Models::Book.create({ title: 'Alan Turing: The Enigma' })
ReedsyInterviewFeed::Services::Upvote.new(user: user, book: book).call

# Get the feed of the user
feed = ReedsyInterviewFeed::Services::Feed.new(user)

# Get the title of the following books
feed.retrieve.map(&:title)
#=> ["Sapiens", "Homo Deus", "21 Lessons for the 21st Century", "Alan Turing: The Enigma"]
