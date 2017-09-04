require 'adapter'

describe "Adapter Pattern" do
  describe Hero do
    it "should have 0 experince 0 quests and level of 1" do
      hero = Hero.new
      expect(hero.level).to eq(1)
      expect(hero.quests.size).to eq(0)
      expect(hero.experience).to eq(0)
    end
  end

  describe Quest do
    let(:quest) { Quest.new(5) }
    let(:hero) { Hero.new }

    it "should have difficulty and nil hero when initialized" do
      expect(quest.difficulty).to eq(5)
      expect(quest.hero).to eq(nil)
    end
    it "should calculate the experience based on difficulty and hero lvl" do
      quest.hero = hero
      expect(quest.calculate_experience).to eq(250)
    end
    it "should add experience to hero on finish" do
      quest.hero = hero
      quest.finish
      expect(hero.experience).to eq(250)
    end
  end

  describe "Finishing a Quest" do
    it "rewards hero with experience points" do
      # reward calculation: difficulty * 50 / hero_level
      # default hero_level is "1"
      hero = Hero.new
      quest = Quest.new(5)

      hero.take_quest(quest)
      hero.finish_quest(quest)

      expect(hero.experience).to eq(250)
    end
  end

  describe "Finishing an OLD Quest" do
    it "rewards hero with experience points" do
      hero = Hero.new
      quest = QuestAdapter.new(OldQuest.new, 5)

      hero.take_quest(quest)
      hero.finish_quest(quest)

      expect(hero.experience).to eq(50)
    end
  end
end
