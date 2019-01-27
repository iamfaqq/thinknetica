require_relative '../lesson4/module/module.rb'

class Part

  include Firmware
  attr_reader :type

  def initialize(type)
    @type = type
  end

end