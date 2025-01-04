class CreateTrades < ActiveRecord::Migration[8.0]
  def change
    create_table :trades do |t|
      t.references :team, null: false, foreign_key: true
      t.string :description

      t.timestamps
    end
  end
end
