class CompositeQuest
  def initialize
    @tasks = []
  end
  def add quest
    @tasks << quest
  end
  def reward
    @tasks.inject(0) { |sum, task| sum + task.reward }
  end
end

class Quest < CompositeQuest
end

class MegaQuest < CompositeQuest
end

class Task
  def initialize
  end
  def reward
    raise NotImplemented
  end
end

class Encounter < Task
  def reward
    100
  end
end

class Puzzle < Task
  def reward
    200
  end
end

class Diplomacy < Task
  def reward
    500
  end
end
