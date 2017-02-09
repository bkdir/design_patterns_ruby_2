require "observer"

module Observer
  describe Hero do
    let(:hero) { Hero.new }

    it "is cursed when discovers cursed Tile" do
      tile = Tile.new cursed: true
      hero.discover(tile)

      expect(hero.cursed?).to be true
    end

    it "is not cursed when discovers a normal Tile" do
      tile = Tile.new
      hero.discover(tile)

      expect(hero.cursed?).to be false
    end

    it "has default health equal to 10" do
      expect(hero.health).to eq 10
    end
    it "can be damaged" do
      hero.damage(6)
      expect(hero.health).to eq 4
    end
  end

  describe Tile do
    let(:hero) { Hero.new }

    it "activates curse" do
      tile = Tile.new cursed: true, hero: hero
      hero.discover(tile)

      tile.activate_curse
      expect(hero.health).to eq 6
    end

    it "activates curse on multiple heroes" do
      hero2 = Hero.new
      tile = Tile.new cursed: true
      hero.discover(tile)
      hero2.discover(tile)

      tile.activate_curse
      expect(hero.health).to eq 6
      expect(hero2.health).to eq 6
    end

    it "is not cursed by default" do
      expect(Tile.new.cursed?).to be false
    end

    it "can be created as cursed" do
      tile = Tile.new cursed: true
      expect(tile.cursed?).to be true
    end
  end
end
