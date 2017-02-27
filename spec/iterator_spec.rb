require "iterator"

module Iterator
  describe "Iterator Pattern" do

    describe Inventory do
      let (:inventory) { inventory = Inventory.new }

      before :each do
        @item1 = Item.new
        @item1.cost = 20

        @item2 = Item.new
        @item2.cost = 10

        inventory.add(@item1)
        inventory.add(@item2)
      end

      it "provides the most expensive item" do
        expensive = Item.new
        expensive.cost = 100
        inventory.add(expensive)

        expect(inventory.max).to eq (expensive)
        expect(inventory.sort).to eq ([@item2, @item1, expensive])
      end

      it "can be iterated through items to get total cost" do
        iterator = InventoryIterator.new(inventory)
        #result = 0

        #old way
        #while iterator.has_next
        #  result += iterator.next.cost
        #end
        
        #second approach
        #inventory.each { |item| result += item.cost }

        #third
        result = inventory.inject(0) { |sum, item| sum + item.cost }
        expect(result).to eq(30)
      end

      it "adds items to its collection" do
        expect(inventory.items.size).to eq(2)
      end
    end

    describe Item do
      let(:item) { Item.new }
      it "has cost" do
        expect(item.cost).to eq(0)
      end
    end
  end
end
