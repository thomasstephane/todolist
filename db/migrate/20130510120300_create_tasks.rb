require_relative '../config'

class CreateTasks < ActiveRecord::Migration
  def change
    # HINT: checkout ActiveRecord::Migration.create_table
    create_table :tasks do |t|

      t.string   :description
      t.boolean  :complete_status
    end
  end
end
