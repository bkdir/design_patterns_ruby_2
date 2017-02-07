require "strategy"

module Strategy
  describe "Strategy Pattern" do

    # At the end test Printers relationship
    describe "Strategy Contract" do
      it "Hero sends print message to Printer" do
        printer = double("printer")
        hero = Hero.new printer

        expect(printer).to receive(:print).with(hero.damage, hero.health, hero.skills)
        hero.print_stats
      end
      
      # make sure strategies respond to print message
      it "BattleStats responds to printer message" do
        expect(BattleStats.new).to respond_to(:print)
      end

      it "SkillStats responds to printer message" do
        expect(SkillStats.new).to respond_to(:print)
      end
    end

    describe Hero do
      # let(:hero) { Hero.new }
      let(:hero) { Hero.new BattleStats.new }

      it "has damage" do
        expect(hero.damage).to eq 10
      end

      it "has health" do
        expect(hero.health).to eq 5
      end

      describe "Printing character Stats" do
        it "prints battle stats by default" do
          #expect(hero.print_stats).to eq("Damage: 10\nHealth: 5")
          expect(hero.print_stats).to eq("<html>Damage: 10\nHealth: 5</html>")
        end

        it "prints skills" do
          #expect(hero.print_stats(:skills)).to eq("Stealth\nDriving\nIntimidation\n")
          hero.printer = SkillStats.new
          expect(hero.print_stats).to eq("<html>Stealth\nDriving\nIntimidation\n</html>")
        end

        it "can use custom ad hoc printer" do
          result = hero.print_stats do |damage, health, skills|
            "Damage: #{damage}\nNumber of skills: #{skills.size}"
          end
          expect(result).to eq "Damage: 10\nNumber of skills: 3"
        end
      end

      describe "skills" do
        it "has stealth" do
          expect(hero.skills).to include(:stealth)
        end

        it "has driving" do
          expect(hero.skills).to include(:driving)
        end

        it "has intimidation" do
          expect(hero.skills).to include(:intimidation)
        end
      end

    end
  end
end
