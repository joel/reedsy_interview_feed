module ReedsyInterviewFeed
  module Models
    RSpec.describe Author do
      let(:author) { Author.new({ name: 'Yuval Noah Harari' }) }

      it { expect(author.name).to eql('Yuval Noah Harari') }
    end
  end
end
