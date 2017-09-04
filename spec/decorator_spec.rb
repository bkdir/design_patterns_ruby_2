require 'spec_helper'
require 'decorator'

describe ItemDecorator do
  let(:item) { Item.new }

  it "common itme should have a category and price" do
    expect(item.category).to eq (:common)
    expect(item.price).to eq (1)
    expect(item).to respond_to(:use)
  end

  it "should have different category&price for magical items" do
    magical_item = MagicItemDecorator.new(item)
    expect(magical_item.category).to eq(:magical)
    expect(magical_item.price).to eq(3)
  end

  it "should support masterpiece magic items" do
    masterpiece = MasterPieceItemDecorator.new(MagicItemDecorator.new(item))
    expect(masterpiece.category).to eq(:masterpiece)
    expect(masterpiece.description).to eq("Common Magical MasterPiece")
  end

end
