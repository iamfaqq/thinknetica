module ValidCheck

  def self.included(base)
    base.send :include, InstanceValid
  end

  module InstanceValid
    def valid?
      validate!
    rescue
      false
    end
  end

end