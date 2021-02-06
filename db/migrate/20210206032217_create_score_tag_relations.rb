class CreateScoreTagRelations < ActiveRecord::Migration[6.0]
  def change
    create_table :score_tag_relations do |t|
      t.references :score, foreign_key: true
      t.references :tag, foreign_key: true
      t.timestamps
    end
  end
end
