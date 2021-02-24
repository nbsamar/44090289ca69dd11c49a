class CreateToys < ActiveRecord::Migration[5.2]
  def change
    create_table :toys do |t|
      t.string :face
      t.integer :x, default: 0
      t.integer :y, default: 0

      t.timestamps
    end
  end
end
