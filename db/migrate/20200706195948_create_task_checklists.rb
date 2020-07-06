class CreateTaskChecklists < ActiveRecord::Migration[6.0]
  def change
    create_table :task_checklists do |t|
      t.integer :task_id
      t.integer :checklist_id

      t.timestamps
    end
  end
end
