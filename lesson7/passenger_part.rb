class PassengerPart < Part
  def initialize(volume)
    super(volume)
    @type = 'пассажирский'
  end
end
