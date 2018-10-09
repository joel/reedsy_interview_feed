module ReedsyInterviewFeed
  module Services
    RSpec.describe Feed do
      let(:user) { Models::User.create({ name: 'Joel AZEMAR' }) }

      before do
        author = Models::Author.new({ name: 'Yuval Noha Harari' })

        Models::Book.create({ title: 'Sapiens', author: author })
        Models::Book.create({ title: 'Homo Deus', author: author })
        Models::Book.create({ title: '21 Lessons for the 21st Century', author: author })

        FollowAnAuthor.new(user: user, author: author).call

        book = Models::Book.create({ title: 'Alan Turing: The Enigma' })

        Upvote.new(user: user, book: book).call
      end

      let(:feed) { described_class.new(user) }

      it do
        expect(feed.send(:data).map(&:title)).to eql(
          [
            'Sapiens',
            'Homo Deus',
            '21 Lessons for the 21st Century',
            'Alan Turing: The Enigma'
          ]
        )
      end

    end
  end
end
