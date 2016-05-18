# Opal::Actioncable

Bring ActionCable support to Opal.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'opal-actioncable'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install opal-actioncable

## Usage

    # assets/javascript/application.rb
    require 'opal-actioncable'

    class TestChannel < ActionCable::Subscription
      def connected
        perform 'send', {data: 23}
      end

      def disconnected
      end

      def received data
      end
    end

    consumer = ActionCable.createConsumer
    consumer.subscriptions.create TestChannel

    # or

    ChatChannel =  TestChannel
    consumer.subscriptions.create ChatChannel, {channel: 'Chat', room: 'default'}

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release` to create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

1. Fork it ( https://github.com/MichaelSp/opal-actioncable/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
