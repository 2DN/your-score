class CreateAverages < ActiveRecord::Migration[6.0]
  def change
    create_table :averages do |t|
      t.string  :avg_title, null: false
      t.integer :avg_jpn_ctp
      t.integer :avg_jpn_classic
      t.integer :avg_jpn_chinese
      t.integer :avg_jpn
      t.integer :avg_math_1_a
      t.integer :avg_math_2_b
      t.integer :avg_math_3_c
      t.integer :avg_math_1
      t.integer :avg_math_2
      t.integer :avg_math_3
      t.integer :avg_math_a
      t.integer :avg_math_b
      t.integer :avg_math_c
      t.integer :avg_math
      t.integer :avg_book_keep
      t.integer :avg_basic_info
      t.integer :avg_science_n_life
      t.integer :avg_basic_physics
      t.integer :avg_physics
      t.integer :avg_basic_chemistry
      t.integer :avg_chemistry
      t.integer :avg_basic_earth_science
      t.integer :avg_earth_science
      t.integer :avg_basic_biology
      t.integer :avg_biology
      t.integer :avg_science
      t.integer :avg_wld_history_a
      t.integer :avg_wld_history_b 
      t.integer :avg_dms_history_a
      t.integer :avg_dms_history_b
      t.integer :avg_geography_a
      t.integer :avg_geography_b
      t.integer :avg_ctp_society
      t.integer :avg_ethics
      t.integer :avg_politics_n_economy
      t.integer :avg_ethics_n_politics_n_economy
      t.integer :avg_society
      t.integer :avg_listening
      t.integer :avg_reading
      t.integer :avg_english
      t.integer :avg_language
      t.timestamps
    end
  end
end
