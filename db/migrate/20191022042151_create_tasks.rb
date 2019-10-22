class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name
      t.string :skills
      t.string :status
      t.string :priority
      t.string :current_agent

      t.timestamps null: false
    end
  end
end
