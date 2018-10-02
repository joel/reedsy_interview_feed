module ReedsyInterviewFeed
  module Models
    RSpec.describe User do
      let(:user) { User.new('Joel AZEMAR') }

      it { expect(user.name).to eql('Joel AZEMAR') }
    end
  end
end
