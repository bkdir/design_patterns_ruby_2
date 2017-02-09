module Observer

  # Ruby also has its own Observable module
  module Observable
    attr_accessor :observers

    def initialize attrs = {}
      @observers = []
    end

    def notify_observer
      observers.each { |observer| observer.update }
    end

    def add_observer(observer)
      @observers << observer
    end
  end

  class Hero
    attr_reader :health

    def initialize
      @cursed = false
      @health = 10
    end

    def cursed?
      @cursed
    end

    def discover tile
      if tile.cursed?
        @cursed = true 
        tile.add_observer(self)
      end
    end

    def damage damage
      @health -= damage
    end

    def update
     damage(4)
    end
  end

  class Tile
    include Observable

    def initialize attrs = {}
      super
      @cursed = attrs.fetch(:cursed, false)
    end
    
    def cursed?
      @cursed
    end

    def activate_curse
      notify_observer
    end
  end
end
