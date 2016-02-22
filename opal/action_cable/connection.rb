class ActionCable::Connection
  include Native::Helpers

  def initialize consumer
    @native = `new ActionCable.Connection(#{consumer})`
    %x{
      Opal.defn(self.$class(), 'isOpen', #{@native}.isOpen);
      Opal.defn(self.$class(), 'isState', #{@native}.isState);
      Opal.defn(self.$class(), 'send', #{@native}.send);
      Opal.defn(self.$class(), 'open', #{@native}.open);
      Opal.defn(self.$class(), 'close', #{@native}.close);
      Opal.defn(self.$class(), 'reopen', #{@native}.reopen);
      Opal.defn(self.$class(), 'getState', #{@native}.getState);
      }
  end

  def send data
    `#{@native}.send(#{data})`
  end

end