class ActionCable::ConnectionMonitor
  include Native::Helpers

  def initialize connection
    @native = `new ActionCable.ConnectionMonitor(#{connection})`
    %x{
      Opal.defn(self.$class(), "visibilityDidChange", #{@native}.visibilityDidChange );
      Opal.defn(self.$class(), "disconnectedRecently", #{@native}.disconnectedRecently );
      Opal.defn(self.$class(), "connectionIsStale", #{@native}.connectionIsStale );
      Opal.defn(self.$class(), "reconnectIfStale", #{@native}.reconnectIfStale );
      Opal.defn(self.$class(), "getPollInterval", #{@native}.getPollInterval );
      Opal.defn(self.$class(), "poll", #{@native}.poll );
      Opal.defn(self.$class(), "stopPolling", #{@native}.stopPolling );
      Opal.defn(self.$class(), "startPolling", #{@native}.startPolling);
      Opal.defn(self.$class(), "recordDisconnect", #{@native}.recordDisconnect );
      Opal.defn(self.$class(), "recordConnect", #{@native}.recordConnect );
      Opal.defn(self.$class(), "recordPing", #{@native}.recordPing );
      Opal.defn(self.$class(), "isRunning", #{@native}.isRunning );
      Opal.defn(self.$class(), "stop", #{@native}.stop );
      Opal.defn(self.$class(), "start", #{@native}.start );
    }
  end
end