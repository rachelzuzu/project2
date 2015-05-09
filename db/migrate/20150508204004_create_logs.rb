class CreateLogs < ActiveRecord::Migration
  def change
    create_table :logs do |t|

      t.timestamps null: false
      t.references :user
    end
  end
end
