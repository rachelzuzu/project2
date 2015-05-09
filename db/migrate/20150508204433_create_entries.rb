class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.date :date
      t.text :food
      t.integer :mood


      t.timestamps null: false
      t.references :log
    end
  end
end

