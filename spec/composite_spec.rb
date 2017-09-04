require 'composite'

describe "Composite Pattern" do
  describe Encounter do
    it "has experience reward of 100" do
      expect(Encounter.new.reward).to eq(100)
    end
  end
  describe Puzzle do
    it "has experience reward of 200" do
      expect(Puzzle.new.reward).to eq(200)
    end
  end
  describe Diplomacy do
    it "has experience reward of 500" do
      expect(Diplomacy.new.reward).to eq(500)
    end
  end
  describe Quest do
    it "consists from Encounter and Diplomacy" do
      quest = Quest.new
      quest.add(Encounter.new)
      quest.add(Diplomacy.new)
      expect(quest.reward).to eq(600)
    end
  end
  describe MegaQuest do
    it "consists from 2 quests and one Encounter" do
      megaquest = MegaQuest.new

      quest1 = Quest.new
      quest1.add(Puzzle.new)
      quest1.add(Encounter.new)

      quest2 = Quest.new
      quest2.add(Diplomacy.new)
      quest1.add(Encounter.new)

      megaquest.add(quest1)
      megaquest.add(quest2)
      megaquest.add(Encounter.new)

      expect(megaquest.reward).to eq(1000)
    end
  end

end
