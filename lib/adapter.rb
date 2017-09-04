class Hero
  attr_accessor :experience, :level, :quests

  def initialize
    @level = 1
    @experience = 0
    @quests = []
  end

  def take_quest quest
    @quests << (quest.hero = self)
  end

  def finish_quest quest
    quest.finish
    @quests.delete(quest)
  end
end

class Quest
  attr_accessor :difficulty, :hero

  def initialize difficulty
    @difficulty = difficulty
    @hero = nil
  end

  def finish
    @hero.experience += calculate_experience
  end

  def calculate_experience
    @difficulty * 50 / @hero.level
  end

  # Assume the rest of this class is quite complex...
end

# An old class. Consider we don't have access to source code or we can't change
# it for some reason. But, we want to use it because it is a nice quest.
# Formula is different. Doesn't have a finis method... we will write an Adapter
class OldQuest
  attr_accessor :difficulty, :experience

  def initialize
    @difficulty = 3
    @experience = 10
  end

  def done
    difficulty * experience
  end
end

class QuestAdapter
  attr_accessor :hero

  def initialize old_quest, difficulty
    @old_quest = old_quest
    @old_quest.difficulty = difficulty
    @hero = nil
  end

  def finish
    @hero.experience += @old_quest.done
  end
end
