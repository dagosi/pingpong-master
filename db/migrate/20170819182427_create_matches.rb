class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.references :player1, index: true, foreign_key: true, null: false
      t.references :player2, index: true, foreign_key: true, null: false
      t.integer :player1_score, null: false
      t.integer :player2_score, null: false
      t.date :played_at, null: false

      t.timestamps null: false
    end
  end
end
