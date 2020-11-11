class CreateCards < ActiveRecord::Migration[5.2]
  def change
    create_table :cards do |t|
      t.string :front
      t.string :back
      t.integer :weight, default: 100
      t.references :deck

      t.timestamps
    end
  end
end
