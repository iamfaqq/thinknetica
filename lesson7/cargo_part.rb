class CargoPart < Part
  def initialize(volume)
    super(volume)
    @type = 'грузовой'
    @free_space = volume.to_i
    @volume = volume.to_i
    @temp_volume = volume.to_i
  end

  def occupy_space(volume)
    @free_space = @temp_volume - volume
    @temp_volume = @free_space
  end

  def release_space(volume)
    @free_space = @temp_volume + volume
    @temp_volume = @free_space
  end
end
