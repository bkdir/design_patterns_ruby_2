# Client will just use the factory: HeroFactory
class Party
  attr_reader :members

  def initialize(factory)
    @members = []
    @factory = factory
  end

  def add_hero(number, type)
    method = "create_#{type}".to_s
    number.times { @members << @factory.send(method) }
  end

  def method_missing(method, *args)
    if method =~ /add_(\w+)/
      add_hero(args[0], $1)
    else
      puts "No such method #{method} with args #{args.join(',')}"
      super
    end
  end
end

# Abstract Factory
class HeroFactory
  def create_warrior
    Warrior.new
  end

  def create_mage
    Mage.new
  end

  def create_rogue
    Rogue.new
  end
end

class Warrior
end

class Mage
end

class Rogue
end
