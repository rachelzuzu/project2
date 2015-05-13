class AddKindToLogs < ActiveRecord::Migration
  def change
    add_column :logs, :kind, :string
  end
end
