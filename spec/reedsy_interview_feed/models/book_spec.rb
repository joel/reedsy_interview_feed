module ReedsyInterviewFeed
  module Models
    RSpec.describe Book do
      let(:author) { Author.new({ name: 'Yuval Noah Harari' }) }
      let(:book)   { Book.new(title: 'Sapiens', published_on: 2017, author: author) }

      it do
        expect(book.title).to eql('Sapiens')
        expect(book.published_on).to eql(2017)
        expect(book.author).to eql(author)
      end
    end
  end
end
