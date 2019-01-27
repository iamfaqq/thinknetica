require_relative 'module/firmwares.rb'

class Part

  TYPE_FORMAT = /^[п][а][с][с][а][ж][и][р][с][к][и][й]$|^[г][р][у][з][о][в][о][й]$/

  include Firmware
  attr_reader :type

  def initialize(type)
    @type = type
    validate!
  end

  def validate!
    #проверка типа
    raise 'Номер не может быть пустым' if type.nil?
    raise 'Неправильный формат типа.
          Допустимые значения:
          пассажирский
          грузовой  ' if type !~ TYPE_FORMAT
  end

end