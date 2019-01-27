class CargoTrain < Train

  def initialize(name, number)
    super(name, number)
    @type = 'Грузовой'
  end

end