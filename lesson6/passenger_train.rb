class PassengerTrain < Train
  def initialize(name, number)
    super(name, number)
    @type = 'Пассажирский'
  end
end