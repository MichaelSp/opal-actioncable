
require 'action_cable'

class ActionCable

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

require 'action_cable/connection'
require 'action_cable/connection_monitor'
require 'action_cable/consumer'
require 'action_cable/subscription'
require 'action_cable/subscriptions'
