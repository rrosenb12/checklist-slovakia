class CreateUserChecklists < ActiveRecord::Migration[6.0]
  def change
    create_table :user_checklists do |t|
      t.integer :user_id
      t.integer :checklist_id

      t.timestamps
    end
  end
end
