require 'action_cable'

class ActionCable

  class << self
    def create_consumer url=nil
      start_debugging
      `if (url === undefined){url = Opal.nil}`
      url ||= get_config("url") || `ActionCable.INTERNAL.default_mount_path`
      @@default_consumer ||= Consumer.new create_web_socket_url(url)
    end

    alias createConsumer create_consumer

    def get_config name
      val = `ActionCable.getConfig(#{name})`
      `if (val === undefined){val = Opal.nil}`
      val
    end

    alias getConfig get_config

    def create_web_socket_url url
      `ActionCable.createWebSocketURL(#{url})`
    end

    alias createWebSocketURL create_web_socket_url

    def default_consumer
      @@default_consumer
    end

    def start_debugging
      @@debugging = true
    end

    alias startDebugging start_debugging

    def stop_debugging
      @@debugging = false
    end

    alias stopDebugging stop_debugging

    def log *messages
      if @@debugging
        messages << `Date.now`
        `console.log.apply(console, ["[ActionCable]"].concat(slice.call(messages)));`
      end
    end

  end
end

require 'action_cable/connection'
require 'action_cable/connection_monitor'
require 'action_cable/consumer'
require 'action_cable/subscription'
require 'action_cable/subscriptions'
