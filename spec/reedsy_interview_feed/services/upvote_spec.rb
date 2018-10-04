module ReedsyInterviewFeed
  module Services
    RSpec.describe Upvote do
      let!(:user) { Models::User.create({ name: 'Joel AZEMAR' }) }
      let(:book)  { Models::Book.create({ title: '21 Lessons for the 21st Century' })}

      subject { described_class.new(user: user, book: book) }

      it do
        expect {
          subject.call
        }.to change {
          user.likes.count
        }.to(+1)
      end

    end
  end
end
