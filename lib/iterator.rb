module Iterator

  class InventoryIterator
    def initialize inventory
      @items = inventory.items
      @index = 0
    end

    def has_next
      @index < @items.size
    end

    def next
      value = @items[@index]
      @index += 1
      value
    end
  end

  class Inventory
    include Enumerable

    attr_reader :items

    def initialize
      @items = []
    end
    
    def add item
      @items << item
    end

    # is being used by Enumerable
    def each(&block)
      #i = 0
      #while i < @items.size
      #  yield(@items[i])
      #  i += 1
      #end
      @items.each(&block)
    end

  end

  class Item
    attr_accessor :cost

    def initialize
      @cost = 0
    end

    # for Enumerable to compare to find the most expensive
    def <=> (other)
      cost <=> other.cost
    end
  end

end
