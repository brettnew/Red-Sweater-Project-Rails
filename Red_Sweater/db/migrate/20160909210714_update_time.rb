class UpdateTime < ActiveRecord::Migration[5.0]
  def change
    remove_column :events, :time, :time
    add_column :events, :time, :string
  end
end
