require "template_method"

module TemplateMethod
  describe "Template Method Pattern" do
    context "Default Hero" do
      let(:hero) { Hero.new }

      it "has default damage rating of 10" do
        expect(hero.damage).to eq(10)
      end

      it "can attack" do
        expect(hero.attack).to eq("Attack dealing 10 damage")
      end

      it "requires subclasses to implement unique_greeting" do
        expect{ hero.greet }.to raise_exception(NoMethodError)
      end
    end

    context "Warrior" do
      let(:hero) { Warrior.new }

      it "has default damage rating of 15" do
        expect(hero.damage).to eq(15)
      end

      it "can attack" do
        expect(hero.attack).to eq("Attack dealing 15 damage")
      end

      it "has Strike special ability" do
        expect(hero.abilities).to include(:strike)
      end

      it "greets other characters" do
        expect( hero.greet ).to eq(["Hello", "Warrior is ready to fight"])
      end
    end

    context "Magician" do
      let(:hero) { Magician.new }

      it "has default damage rating of 7" do
        expect(hero.damage).to eq(7)
      end

      it "can attack" do
        expect(hero.attack).to eq("Attack dealing 7 damage")
      end

      it "has Magic Arrow special ability" do
        expect(hero.abilities).to include(:magic_arrow)
      end

      it "greets other characters" do
        expect( hero.greet ).to eq(["Hello", "Magician is ready to fight"])
      end
    end
  end
end
