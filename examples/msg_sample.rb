ReedsyInterviewFeed.configure do |config|
  config.connection = ::Bunny.new(automatically_recover: false).tap { |c| c.start }
end

pub = ReedsyInterviewFeed::Messages::Publisher.new('foo')
pub.send('Metaphors We Live By')

ReedsyInterviewFeed.configure do |config|
  config.connection = ::Bunny.new(automatically_recover: false).tap { |c| c.start }
end

subscriber = ReedsyInterviewFeed::Messages::Subscriber.new('foo')
subscriber.receive { |msg| puts(msg) }
