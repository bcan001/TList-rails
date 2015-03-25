class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :task
      t.date :due_date
      t.integer :list_id
      t.boolean :completed

      t.timestamps null: false
    end
  end
end
