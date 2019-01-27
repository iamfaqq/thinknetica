module ValidCheck

  def self.included(base)
    base.extend InstanceValid
  end

  module InstanceValid
    def valid?
      self.validate!
    rescue
      false
    end
  end

end