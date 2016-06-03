class ActionCable::Subscription
  include Native::Helpers

  def initialize consumer, params
    @native = `new ActionCable.Subscription(#{consumer}, #{params.to_n})`
    %x{
      Opal.defn(self.$class(), 'perform', #{self}.$perform)
      Opal.defn(self.$class(), 'received', #{self}.$_received)
      if (#{respond_to?(:disconnected)}) Opal.defn(self.$class(), 'disconnected', #{self}.$disconnected)
      if (#{respond_to?(:rejected)}) Opal.defn(self.$class(), 'rejected', #{self}.$rejected)
      if (#{respond_to?(:connected)}) Opal.defn(self.$class(), 'connected', #{self}.$connected)

      Opal.defn(self.$class(), 'send', #{@native}.send)
      Opal.defn(self.$class(), 'unsubscribe', #{@native}.unsubscribe)
      Opal.defn(self.$class(), 'identifier', #{@native}.identifier)
    }

    self.class.instance_methods(false).each do |method_name|
      next if method_name == :perform
      %x{#{@native}[method_name] = function(){
            if (arguments[0] !== null && typeof arguments[0] === 'object')
              arguments[0] = $scope.get('Hash').$new(arguments[0])
            #{self}["$" + #{method_name}].apply(self, arguments);
          }
        }
    end
  end

  def perform action, data={}
    data ||= {}
    data[:action] = action
    `#{@native}.send(#{data.to_n})`
  end

  private
  def _received data
    data = Hash.new data
    if (data.keys == ["action", "data"])
      send(data["action"], data["data"])
    else
      received Hash.new data if respond_to?(:received)
    end
  end

end
