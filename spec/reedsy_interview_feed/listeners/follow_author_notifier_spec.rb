module ReedsyInterviewFeed
  module Listeners
    RSpec.describe FollowAuthorNotifier do
      let(:user)   { Models::User.create({ name: 'Joel AZEMAR' }) }
      let(:author) { Models::Author.create({ name: 'Yuval Noha Harari' }) }

      before do
        Models::Book.create({ title: '21 Lessons for the 21st Century', author: author })
      end

      subject { described_class.new }

      before do
        publisher = instance_double('ReedsyInterviewFeed::Messages::Publisher')
        expect(publisher).to receive(:send).with('21 Lessons for the 21st Century')
        expect(subject).to receive(:publisher).with("user-#{user.id}").and_return(publisher)
      end

      it { subject.notify(user.id, author.id) }

    end
  end
end
