class CreateLists < ActiveRecord::Migration[5.0]
  def change
    create_table :lists do |t|
      t.references :board, foreign_key: true
      t.references :creator, foreign_key: true
      t.string :title

      t.timestamps
    end
  end
end
