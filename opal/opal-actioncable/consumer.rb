class ActionCable::Consumer
  include Native::Helpers
  attr_reader :subscriptions, :connection, :connectionMonitor

  def initialize url
    @url = url
    @subscriptions = ActionCable::Subscriptions.new self
    @connection = ActionCable::Connection.new self
    @connectionMonitor = ActionCable::ConnectionMonitor.new self
    %x{
        Opal.defn(self.$class(), 'send', #{self}.$send);
      }
  end

  def send data
    @connection.send data
  end
end