class ActionCable::Consumer
  include Native::Helpers
  attr_reader :subscriptions, :connection, :connectionMonitor

  def initialize url
    @url = url
    @subscriptions = ActionCable::Subscriptions.new self
    @connection = ActionCable::Connection.new self
    %x{
        Opal.defn(self.$class(), 'send', #{self}.$send);
        Opal.defn(self.$class(), 'connect', #{self}.$connect);
        Opal.defn(self.$class(), 'disconnect', #{self}.$disconnect);
        Opal.defn(self.$class(), 'ensureActiveConnection', #{self}.$ensureActiveConnection);
      }
  end

  def send data
    @connection.send data
  end

  def connect
    `#{@connection}.open()`
  end

  def disconnect
    `#{@connection}.close({allowReconnect: false})`
  end
  
  def ensureActiveConnection
    connect if `!#{@connection}.isActive()`
  end
end