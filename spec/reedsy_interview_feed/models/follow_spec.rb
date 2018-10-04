module ReedsyInterviewFeed
  module Models
    RSpec.describe Follow do
      let(:user)   { User.new({ name: 'Joel AZEMAR' }) }
      let(:author) { Author.new({ name: 'Yuval Noha Harari' }) }
      let(:follow) { Follow.new({ user: user, author: author })}

      it { expect(follow.user).to eql(user) }
      it { expect(follow.author).to eql(author) }
    end
  end
end
