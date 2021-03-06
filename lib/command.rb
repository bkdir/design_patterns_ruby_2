module Command
  class Reactor
    def initialize
      @functional = false
      @right_command = %Q{
AmplifyShield
CalibrateDriver
TestCompiler
InstallRegulator
}
    end

    def fix(result)
      @functional = result == @right_command
    end

    def functional?
      @functional
    end
  end

  class Computer
    attr_reader :queue

    def initialize
      @queue = []
    end

    def add command
      @queue << command
    end
    
    def execute
      result = queue.inject("\n") { |result, command| result + command.execute + "\n" }
      puts result
      result
    end
  end

  class AmplifyShieldCommand
    def execute
      "AmplifyShield"
    end
  end

  class CalibrateDriverCommand
    def execute
      "CalibrateDriver"
    end
  end

  class TestCompilerCommand
    def execute
      "TestCompiler"
    end
  end

  class InstallRegulatorCommand
    def execute
      "InstallRegulator"
    end
  end
end
