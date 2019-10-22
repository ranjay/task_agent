class CreateAgentLists < ActiveRecord::Migration
  def change
    create_table :agent_lists do |t|
      t.string :name
      t.string :skills
      t.string :status
      t.string :priority
      t.string :status
      t.datetime :last_task_time

      t.timestamps null: false
    end
  end
end
