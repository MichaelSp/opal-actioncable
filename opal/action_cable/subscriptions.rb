class ActionCable::Subscriptions
  include Native::Helpers

  def initialize consumer
    @native = `new ActionCable.Subscriptions(#{consumer})`
    %x{
        Opal.defn(self.$class(), 'add', #{@native}.add);
        Opal.defn(self.$class(), 'notify', #{@native}.notify);
        Opal.defn(self.$class(), 'notifyAll', #{@native}.notifyAll);
        Opal.defn(self.$class(), 'reload', #{@native}.reload);
        Opal.defn(self.$class(), 'findAll', #{@native}.findAll);
        Opal.defn(self.$class(), 'sendCommand', #{@native}.sendCommand);
        Opal.defn(self.$class(), 'forget', #{@native}.forget);
        Opal.defn(self.$class(), 'reject', #{@native}.reject);
        self.subscriptions = #{@native}.subscriptions;
        self.consumer = #{@native}.consumer;
      }
  end

  def create mixin, params={}
    params[:channel] ||= mixin.name
    mixin.new self, params
  end
end