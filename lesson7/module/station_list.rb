module StationList
  def self.included(base)
    base.extend ClassMethods
  end

  module ClassMethods
    @@all = []

    def add(station)
      @@all << station
    end

    def all
      @@all
    end
  end
end
