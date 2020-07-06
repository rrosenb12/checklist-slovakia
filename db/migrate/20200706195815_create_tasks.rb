class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.integer :timer_id
      t.integer :category_id
      t.string :name
      t.string :description

      t.timestamps
    end
  end
end
