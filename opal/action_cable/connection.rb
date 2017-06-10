class ActionCable::Connection
  include Native::Helpers

  def initialize consumer
    @native = `new ActionCable.Connection(#{consumer})`
    @subscriptions = consumer.subscriptions
    @monitor = ActionCable::ConnectionMonitor.new self

    %x{
      Opal.defn(self.$class(), 'send', function(){ return self.$delegate_native('send', arguments); });
      Opal.defn(self.$class(), 'open', function(){ return self.$delegate_native('open', arguments); });
      Opal.defn(self.$class(), 'close', function(){ return self.$delegate_native('close', arguments); });
      Opal.defn(self.$class(), 'reopen', function(){ return self.$delegate_native('reopen', arguments); });
      Opal.defn(self.$class(), 'getProtocol', function(){ return self.$delegate_native('getProtocol', arguments); });
      Opal.defn(self.$class(), 'isOpen', function(){ return self.$delegate_native('isOpen', arguments); });
      Opal.defn(self.$class(), 'isActive', function(){ return self.$delegate_native('isActive', arguments); });
      Opal.defn(self.$class(), 'isProtocolSupported', function(){ return self.$delegate_native('isProtocolSupported', arguments); });
      Opal.defn(self.$class(), 'isState', function(){ return self.$delegate_native('isState', arguments); });
      Opal.defn(self.$class(), 'getState', function(){ return self.$delegate_native('getState', arguments); });
      Opal.defn(self.$class(), 'installEventHandlers', function(){ return self.$delegate_native('installEventHandlers', arguments); });
      Opal.defn(self.$class(), 'uninstallEventHandlers', function(){ return self.$delegate_native('uninstallEventHandlers', arguments); });
    }
  end

  def send data
    data = `#{`#{data}['$is_a?']` ? data.to_n : data}`
    `#{@native}.send(#{data})`
  end

  def delegate_native name, args=nil
    `#{@native}[#{name}].apply(#{@native}, args)`
  end


end
