module ValidCheck
  def self.included(base)
    base.send :include, InstanceValid
  end

  module InstanceValid
    def valid?
      validate!
    rescue StandardError
      false
    end
  end
end
