require "command"

module Command

  describe "Command Pattern" do

    describe Reactor do
      it "is fixed if commands are executed in the right order" do
        computer = Computer.new
        computer.add(AmplifyShieldCommand.new)
        computer.add(CalibrateDriverCommand.new)
        computer.add(TestCompilerCommand.new)
        computer.add(InstallRegulatorCommand.new)

        reactor = Reactor.new
        expect(reactor.functional?).to be false

        reactor.fix(computer.execute)
        expect(reactor.functional?).to be true
      end
    end

    describe Computer do
      let(:computer) { Computer.new }

      before :each do
        computer.add(CalibrateDriverCommand.new)
        computer.add(TestCompilerCommand.new)
      end

      it "can add commands to its queue" do
        expect(computer.queue.size).to eq 2
      end

      it "can execute commands in order" do
        expect(computer.execute).to eq %q{
CalibrateDriver
TestCompiler
}
      end
    end

    describe "Commands" do

      describe AmplifyShieldCommand do
        it "amplifies shield" do
          command = AmplifyShieldCommand.new
          expect(command.execute).to eq ("AmplifyShield")
        end
      end

      describe CalibrateDriverCommand do
        it "calibrates driver" do
          command = CalibrateDriverCommand.new
          expect(command.execute).to eq ("CalibrateDriver")
        end
      end

      describe TestCompilerCommand do
        it "tests compiler" do
          command = TestCompilerCommand.new
          expect(command.execute).to eq ("TestCompiler")
        end
      end

      describe InstallRegulatorCommand do
        it "Installs regulator" do
          command = InstallRegulatorCommand.new
          expect(command.execute).to eq ("InstallRegulator")
        end
      end
    end
  end
end
