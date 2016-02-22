class ActionCable::ConnectionMonitor
  include Native::Helpers

  def initialize consumer
    @native = `new ActionCable.ConnectionMonitor(#{consumer})`
  end
end