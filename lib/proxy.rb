class ComputerProxy

  def initialize computer, user
    @computer = computer
    @user = user
  end

  def authorized?
    @user.user_type == "Super User"
  end

  def execute
    raise ForbiddenAccessError unless authorized?
    @computer.execute
  end
end

class Computer
  def initialize
  end

  def execute
    "Executing"
  end
end

class User
  attr_reader :user_type

  def initialize user_type
    @user_type = user_type
  end
end

ForbiddenAccessError = Class.new(StandardError)
