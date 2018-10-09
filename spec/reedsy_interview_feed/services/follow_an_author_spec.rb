module ReedsyInterviewFeed
  module Services
    RSpec.describe FollowAnAuthor do
      let!(:user)  { Models::User.create({ name: 'Joel AZEMAR' }) }
      let(:author) { Models::Author.new({ name: 'Yuval Noha Harari' }) }

      subject { described_class.new(user: user, author: author) }

      it do
        expect {
          subject.call
        }.to change {
          user.follows.count
        }.to(+1).and broadcast(:notify)
      end

    end
  end
end
