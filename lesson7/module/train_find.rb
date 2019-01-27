module TrainFind
  def self.included(base)
    base.extend ClassMethods
  end

  module ClassMethods
    @@all = {}

    def add(train)
      @@all.store(train.number, train)
    end

    def find(number)
      @@all[number]
    end

    def all
      @@all
    end
  end
end
