class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.string :name
      t.string :ndbno
      t.string :protein
      t.string :fat
      t.string :carb
      t.string :kcal
      t.string :unit

      t.references :entry
      t.timestamps null: false
    end
  end
end
