class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.string :task_title, null: false
      t.string :memo
      t.date   :limit_date, null: false
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
