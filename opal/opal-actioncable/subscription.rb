class ActionCable::Subscription
  include Native::Helpers

  def initialize subscriptions, params
    @native = `new ActionCable.Subscription(#{subscriptions}, #{params.to_n})`
    %x{Opal.defn(self.$class(), 'perform', #{@native}.perform)}
  end

  def perform action, data
    @native.perform action, data
  end

end