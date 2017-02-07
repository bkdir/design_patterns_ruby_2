module TemplateMethod
  class Hero
    attr_reader :damage, :abilities

    def initialize
     initialize_stats

     @damage = damage_rating
     @abilities = occupation_abilities
    end

    def initialize_stats
    end

    def damage_rating
      10
    end

    def occupation_abilities
      []
    end

    def attack
      "Attack dealing #@damage damage"
    end
    
    def greet
      greeting = ["Hello"]
      greeting << unique_greeting
      greeting
    end

    def unique_greeting
      raise NoMethodError, "must be implemented in subclasses"
    end

  end

  class Warrior < Hero
    def damage_rating
      15
    end

    def occupation_abilities
      [:strike]
    end

    def unique_greeting
      "Warrior is ready to fight"
    end
  end

  class Magician < Hero
    def damage_rating
      7
    end

    def occupation_abilities
      [:magic_arrow]
    end

    def unique_greeting
      "Magician is ready to fight"
    end
  end
end
