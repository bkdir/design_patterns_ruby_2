module Strategy
  class Hero
    attr_reader :damage, :health, :skills
    attr_accessor :printer

    def initialize (printer)
      @damage = 10
      @health = 5
      @skills = [ :stealth, :driving, :intimidation ]

      @printer = printer
    end

    # Bad way
    #def print_stats stats = nil
    #  if stats == :skills
    #    skills.inject("") { |result, skill| result + skill.to_s.capitalize + "\n" }
    #  else
    #    "Damage: #{damage}\nHealth: #{health}"
    #  end
    #end

    # Dependency Injected, coupled way
    #def print_stats
    #  printer.print(self)
    #end

    # less coupling
    def print_stats
      if block_given?
        yield(damage, health, skills)
      else
        printer.print(damage, health, skills)
      end
    end

  end

  # At the end create a HTMLPrinter class to be a base for all
  # use inheritance(template like) in Strategy
  class HTMLPrinter
    def print(damage, health, skills)
      result = header
      result += content(damage, health, skills)
      result += footer
    end

    def header
      "<html>"
    end

    def footer
      "</html>"
    end

    def content(damage, health, skills)
      raise "You must implement content"
    end
  end

  class BattleStats < HTMLPrinter
    #def print(context)
    #  "Damage: #{context.damage}\nHealth: #{context.health}"
    #end
    
    def content(damage, health, skills)
      "Damage: #{damage}\nHealth: #{health}"
    end
  end

  class SkillStats < HTMLPrinter
    #def print(context)
    #  context.skills.inject("") { |result, skill| result + skill.to_s.capitalize + "\n" }
    #end

    def content(damage, health, skills)
      skills.inject("") { |result, skill| result + skill.to_s.capitalize + "\n" }
    end
  end
end
