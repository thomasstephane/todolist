class AddListId < ActiveRecord::Migration
  def change
    add_column :tasks, :created_at, :datetime
    add_column :tasks, :completed_at, :datetime
  end
end
