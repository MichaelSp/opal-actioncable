
require 'opal-actioncable/connection'
require 'opal-actioncable/connection_monitor'
require 'opal-actioncable/consumer'
require 'opal-actioncable/subscription'
require 'opal-actioncable/subscriptions'


module ActionCable

  class << self
    def create_consumer url
      @@default_consumer ||= Consumer.new create_web_socket_url(url)
    end
    alias createConsumer create_consumer

    def get_config name
      `ActionCable.getConfig(#{name})`
    end
    alias getConfig get_config

    def create_web_socket_url url
      `ActionCable.createWebSocketURL(#{url})`
    end
    alias createWebSocketURL create_web_socket_url

    def default_consumer
      @@default_consumer
    end
  end
end