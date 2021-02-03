class CreateSubjects < ActiveRecord::Migration[6.0]
  def change
    create_table :subjects do |t|
      t.string :sub_title, null: false
      t.string :sub_jpn_ctp
      t.string :sub_jpn_classic
      t.string :sub_jpn_chinese
      t.string :sub_jpn
      t.string :sub_math_1_a
      t.string :sub_math_2_b
      t.string :sub_math_3_c
      t.string :sub_math_1
      t.string :sub_math_2
      t.string :sub_math_3
      t.string :sub_math_a
      t.string :sub_math_b
      t.string :sub_math_c
      t.string :sub_math
      t.string :sub_book_keep
      t.string :sub_basic_info
      t.string :sub_science_n_life
      t.string :sub_basic_physics
      t.string :sub_physics
      t.string :sub_basic_chemistry
      t.string :sub_chemistry
      t.string :sub_basic_earth_science
      t.string :sub_earth_science
      t.string :sub_basic_biology
      t.string :sub_biology
      t.string :sub_science
      t.string :sub_wld_history_a
      t.string :sub_wld_history_b 
      t.string :sub_dms_history_a
      t.string :sub_dms_history_b
      t.string :sub_geography_a
      t.string :sub_geography_b
      t.string :sub_ctp_society
      t.string :sub_ethics
      t.string :sub_politics_n_economy
      t.string :sub_ethics_n_politics_n_economy
      t.string :sub_society
      t.string :sub_listening
      t.string :sub_reading
      t.string :sub_english
      t.string :sub_language
      t.timestamps
    end
  end
end
