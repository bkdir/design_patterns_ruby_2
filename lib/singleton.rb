class HeroFactory
  # Ruby's singleton class is the way to go, of course:)
  # require 'singleton' + include Singleton
  @instance = nil

  def self.instance
    @instance ||= HeroFactory.send(:new)
  end

  private_class_method :new
end
