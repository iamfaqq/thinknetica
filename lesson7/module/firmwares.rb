module Firmware
  def self.included(base)
    base.send :include, InstanceMethods
  end

  module InstanceMethods
    attr_accessor :firmware_name

    def firmware=(name)
      self.firmware_name = name
    end
  end
end
