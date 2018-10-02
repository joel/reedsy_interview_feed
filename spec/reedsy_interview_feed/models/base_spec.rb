RSpec.describe ReedsyInterviewFeed::Models::Base do
  let(:model) do
    Class.new do
      include ReedsyInterviewFeed::Models::Base
    end.new
  end

  it { expect(model.object_id).to eql(model.id) }
end
