require 'singleton'

describe HeroFactory do
  let(:factory) {HeroFactory.instance}

  it "should be an instance of HeroFactory class" do
    expect(factory).to be_instance_of(HeroFactory)
  end

  it "should be the same object even if we call the instance multiple times" do
    another_factory = HeroFactory.instance
    expect(another_factory).to eq(factory)
  end

  it "should be forbidden to call new method" do
    expect {HeroFactory.new}.to raise_exception NoMethodError
  end
end
