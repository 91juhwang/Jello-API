class CreateBoards < ActiveRecord::Migration[5.0]
  def change
    create_table :boards do |t|
      t.references :creator, foreign_key: true
      t.string :title
      t.boolean :archived

      t.timestamps
    end
  end
end
