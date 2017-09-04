class BoardBuilder
  attr_accessor :board

  def initialize width, height, difficulty
    @board = Board.new
    @board.width = width
    @board.height = height
    @board.difficulty = difficulty
    @board.tiles = []
    @board.monsters = []
  end

  def add_tiles type, number
    message = "create_#{type}_tiles"
    @board.tiles.concat(TileFactory.send(message, number))
  end

  def add_monsters type, number
    message = "create_#{type}_monsters"
    @board.monsters.concat(MonsterFactory.send(message, number))
  end
end

class Board
  attr_accessor :width, :height, :tiles, :monsters, :difficulty
  def initialize
    @width = width
    @height = height
    @difficulty = difficulty
    @tiles = tiles
    @monsters = monsters
  end
end

class TileFactory
  class << self
    def create_plain_tiles number
      (0...number).map { PlainTile.new }
    end
    def create_trap_tiles number
      (0...number).map { TrapTile.new }
    end
  end
end

class MonsterFactory
  class << self
    def create_orc_monsters number
      (0...number).map { OrcMonster.new }
    end
    def create_goblin_monsters number
      (0...number).map { GoblinMonster.new }
    end
  end
end

PlainTile = Class.new
TrapTile = Class.new
OrcMonster = Class.new
GoblinMonster = Class.new
