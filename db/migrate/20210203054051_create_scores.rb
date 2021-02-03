class CreateScores < ActiveRecord::Migration[6.0]
  def change
    create_table :scores do |t|
      t.string  :title, null: false
      t.integer :jpn_ctp
      t.integer :jpn_classic
      t.integer :jpn_chinese
      t.integer :jpn
      t.integer :math_1_a
      t.integer :math_2_b
      t.integer :math_3_c
      t.integer :math_1
      t.integer :math_2
      t.integer :math_3
      t.integer :math_a
      t.integer :math_b
      t.integer :math_c
      t.integer :math
      t.integer :book_keep
      t.integer :basic_info
      t.integer :science_n_life
      t.integer :basic_physics
      t.integer :physics
      t.integer :basic_chemistry
      t.integer :chemistry
      t.integer :basic_earth_science
      t.integer :earth_science
      t.integer :basic_biology
      t.integer :biology
      t.integer :science
      t.integer :wld_history_a
      t.integer :wld_history_b 
      t.integer :dms_history_a
      t.integer :dms_history_b
      t.integer :geography_a
      t.integer :geography_b
      t.integer :ctp_society
      t.integer :ethics
      t.integer :politics_n_economy
      t.integer :ethics_n_politics_n_economy
      t.integer :society
      t.integer :listening
      t.integer :reading
      t.integer :english
      t.integer :language
      t.text    :review
      t.references :user, null: false, foreign_key: true
      t.references :average, null: false, foreign_key: true
      t.references :subject, null: false, foreign_key: true
      t.timestamps
    end
  end
end
