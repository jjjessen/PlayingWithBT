class AddPriceToTrades < ActiveRecord::Migration[8.0]
  def change
    add_monetize :trades, :price
  end
end
