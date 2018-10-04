module ReedsyInterviewFeed
  module Models
    RSpec.describe Like do
      let(:user) { User.new({ name: 'Joel AZEMAR' }) }
      let(:book) { Book.new({ title: '21 Lessons for the 21st Century' })}
      let(:like) { Like.new({ user: user, book: book })}

      it { expect(like.user).to eql(user) }
      it { expect(like.book).to eql(book) }
    end
  end
end
