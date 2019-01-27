require_relative 'module/firmwares.rb'

class Part
  include Firmware
  attr_reader :volume, :type, :free_spaces

  def initialize(volume)
    @volume = volume.to_i
    @temp_volume = volume.to_i
    validate!
  end

  def validate!
    raise 'Вместимость не может быть пустым' if volume.nil?
  end

  def occupy_space
    @free_space = @temp_volume - 1
    @temp_volume -= 1
  end

  def release_space
    @free_space = @temp_volume + 1
    @temp_volume += 1
  end
end
