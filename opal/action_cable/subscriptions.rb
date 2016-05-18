class ActionCable::Subscriptions
  include Native::Helpers

  def initialize consumer
    @consumer = consumer
    @native = `new ActionCable.Subscriptions(#{consumer})`
    %x{
        Opal.defn(self.$class(), 'create', #{@native}.create);
        Opal.defn(self.$class(), 'add', #{@native}.add);
        Opal.defn(self.$class(), 'remove', #{@native}.remove);
        Opal.defn(self.$class(), 'reject', #{@native}.reject);
        Opal.defn(self.$class(), 'forget', #{@native}.forget);
        Opal.defn(self.$class(), 'findAll', #{@native}.findAll);
        Opal.defn(self.$class(), 'reload', #{@native}.reload);
        Opal.defn(self.$class(), 'notifyAll', #{@native}.notifyAll);
        Opal.defn(self.$class(), 'notify', #{@native}.notify);
        Opal.defn(self.$class(), 'sendCommand', #{@native}.sendCommand);

        self.subscriptions = #{@native}.subscriptions;
        self.consumer = #{@native}.consumer;
      }
  end

  def create params
    if params.is_a? Hash
      mixin = params[:channel]
    else
      mixin = params
      params = {channel: params.name}
    end
    subscription = mixin.new @consumer, params
    `#{@native}.add(#{subscription})`
    subscription
  end
end