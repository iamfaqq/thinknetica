module Firmware
  def self.included(base)
    base.send :include, InstanceMethods
  end
  module InstanceMethods
    attr_accessor :firmware_name
    def set_firmware(name)
      self.firmware_name = name
    end
  end
end

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

module TrainFind
  def self.included(base)
    base.extend ClassMethods
  end
  module ClassMethods
    @@all = []
    def add(train)
      @@all << train
    end
    def find(number)
      @@all.each {|train| puts "#{train.inspect}" if train.number == number}
    end
    def all
      @@all
    end
  end
end

module InstanceCounter

  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  module ClassMethods
    attr_reader :instances

    def count
      @instances ||= 0
      @instances += 1
    end
  end

  module InstanceMethods

    private

    def register_instance
      self.class.count
    end
  end

end