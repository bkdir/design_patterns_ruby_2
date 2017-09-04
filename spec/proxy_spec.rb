require 'proxy'

describe ComputerProxy do
  let(:computer) {Computer.new}

  it "should allow priviliged user to execute a command" do
    user = User.new("Super User")
    proxy = ComputerProxy.new(computer, user)

    expect(proxy.execute).to eq("Executing")
  end

  it "should prevent unauthorized people from executing a command" do
    user = User.new("Suzer User")
    proxy = ComputerProxy.new(computer, user)
    expect{proxy.execute}.to raise_error ForbiddenAccessError
  end

  it "delegates all functionality to the real object" do 
    user = User.new("Super User")
    computer = Computer.new
    proxy = ComputerProxy.new(computer, user)

    expect(computer).to receive(:execute)
    proxy.execute
  end

end
