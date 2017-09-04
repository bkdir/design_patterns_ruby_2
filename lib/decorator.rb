require 'forwardable'

class ItemDecorator
  extend Forwardable
  def_delegator :@item, :use

  attr_accessor :item
  def initialize item
    @item = item
  end
end

class MagicItemDecorator < ItemDecorator
  def price
    @item.price * 3
  end
  def category
    :magical
  end

  def description
    @item.description + " Magical"
  end
end

class MasterPieceItemDecorator < ItemDecorator
  def category
    :masterpiece
  end

  def description
    @item.description + " MasterPiece"
  end
end

class Item
  attr_accessor :category, :price, :description

  def initialize category = :common, price = 1
    @category = category
    @price = price
    @description = "Common"
  end

  def use
  end

end
