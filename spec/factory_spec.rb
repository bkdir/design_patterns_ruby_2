require 'spec_helper'
require_relative '../lib/factory.rb'

describe "Factory Pattern" do
  let(:party) { Party.new(HeroFactory.new) }

  it "is a party of warriors" do
    party.add_warrior(3)
    expect(party.members.count{ |member| member.class == Warrior }).to eq(3)
  end

  it "is a party of Mages" do
    party.add_mage(3)
    expect(party.members.count{ |member| member.class == Mage }).to eq(3)
  end

  it "is a party of Rogues" do
    party.add_rogue(3)
    expect(party.members.count{ |member| member.class == Rogue }).to eq(3)
  end


  it "Can mix heroes" do
    party.add_mage(3)
    party.add_warrior(2)
    expect(party.members.count{ |member| member.class == Mage }).to eq(3)
    expect(party.members.count{ |member| member.class == Warrior }).to eq(2)
    expect(party.members.count).to eq(5)
  end
end
