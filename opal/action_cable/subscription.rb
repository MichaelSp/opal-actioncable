class ActionCable::Subscription
  include Native::Helpers

  def initialize subscriptions, params
    @native = `new ActionCable.Subscription(#{subscriptions}, #{params.to_n})`
    %x{Opal.defn(self.$class(), 'perform', #{@native}.perform)}

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

  def perform action, data
    `#{@native}.perform(action, #{data.to_n})`
  end

end
