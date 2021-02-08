class UpdateScoreSubjectAverage
  include ActiveModel::Model

  attr_accessor :title, :jpn_ctp, :jpn_classic, :jpn_chinese, :jpn,
                :math_1_a, :math_2_b, :math_3_c, :math_1_a, :math_1, :math_2, :math_3, :math_a, :math_b, :math_c, :math,
                :book_keep, :basic_info,
                :science_n_life, :basic_physics, :physics, :basic_chemistry, :chemistry, :basic_earth_science, :earth_science, :basic_biology, :biology, :science,
                :wld_history_a, :wld_history_b, :dms_history_a, :dms_history_b, :geography_a, :geography_b, :ctp_society, :ethics, :politics_n_economy, :ethics_n_politics_n_economy, :society,
                :listening, :reading, :english, :language, :review,
                :user_id, :average_id, :subject_id,
                :avg_title, :avg_jpn_ctp, :avg_jpn_classic, :avg_jpn_chinese, :avg_jpn,
                :avg_math_1_a, :avg_math_2_b, :avg_math_3_c, :avg_math_1_a, :avg_math_1, :avg_math_2, :avg_math_3, :avg_math_a, :avg_math_b, :avg_math_c, :avg_math,
                :avg_book_keep, :avg_basic_info,
                :avg_science_n_life, :avg_basic_physics, :avg_physics, :avg_basic_chemistry, :avg_chemistry, :avg_basic_earth_science, :avg_earth_science, :avg_basic_biology, :avg_biology, :avg_science,
                :avg_wld_history_a, :avg_wld_history_b, :avg_dms_history_a, :avg_dms_history_b, :avg_geography_a, :avg_geography_b, :avg_ctp_society, :avg_ethics, :avg_politics_n_economy, :avg_ethics_n_politics_n_economy, :avg_society,
                :avg_listening, :avg_reading, :avg_english, :avg_language,
                :sub_jpn_ctp, :sub_jpn_classic, :sub_jpn_chinese, :sub_jpn,
                :sub_math_1_a, :sub_math_2_b, :sub_math_3_c, :sub_math_1_a, :sub_math_1, :sub_math_2, :sub_math_3, :sub_math_a, :sub_math_b, :sub_math_c, :sub_math,
                :sub_book_keep, :sub_basic_info,
                :sub_science_n_life, :sub_basic_physics, :sub_physics, :sub_basic_chemistry, :sub_chemistry, :sub_basic_earth_science, :sub_earth_science, :sub_basic_biology, :sub_biology, :sub_science,
                :sub_wld_history_a, :sub_wld_history_b, :sub_dms_history_a, :sub_dms_history_b, :sub_geography_a, :sub_geography_b, :sub_ctp_society, :sub_ethics, :sub_politics_n_economy, :sub_ethics_n_politics_n_economy, :sub_society,
                :sub_listening, :sub_reading, :sub_english, :sub_language,
                :tag_name, :tag_id, :score_id
  
  
  with_options presence: true do
    validates :title
    validates :avg_title
    validates :user_id
  end

  with_options numericality: { only_integer: true } do
    validates :jpn_ctp
    validates :jpn_classic
    validates :jpn_chinese
    validates :jpn
    validates :math_1_a
    validates :math_2_b
    validates :math_3_c
    validates :math_1
    validates :math_2
    validates :math_3
    validates :math_a
    validates :math_b
    validates :math_c
    validates :math
    validates :book_keep
    validates :basic_info
    validates :science_n_life
    validates :basic_physics
    validates :physics
    validates :basic_chemistry
    validates :chemistry
    validates :basic_earth_science
    validates :earth_science
    validates :basic_biology
    validates :biology
    validates :science
    validates :wld_history_a
    validates :wld_history_b
    validates :dms_history_a
    validates :dms_history_b
    validates :geography_a
    validates :geography_b
    validates :ctp_society
    validates :ethics
    validates :politics_n_economy
    validates :ethics_n_politics_n_economy
    validates :society
    validates :listening
    validates :reading
    validates :english
    validates :language
    validates :avg_jpn_ctp
    validates :avg_jpn_classic
    validates :avg_jpn_chinese
    validates :avg_jpn
    validates :avg_math_1_a
    validates :avg_math_2_b
    validates :avg_math_3_c
    validates :avg_math_1_a
    validates :avg_math_1
    validates :avg_math_2
    validates :avg_math_3
    validates :avg_math_a
    validates :avg_math_b
    validates :avg_math_c
    validates :avg_math
    validates :avg_book_keep
    validates :avg_basic_info
    validates :avg_science_n_life
    validates :avg_basic_physics
    validates :avg_physics
    validates :avg_basic_chemistry
    validates :avg_chemistry
    validates :avg_basic_earth_science
    validates :avg_earth_science
    validates :avg_basic_biology
    validates :avg_biology
    validates :avg_science
    validates :avg_wld_history_a
    validates :avg_wld_history_b
    validates :avg_dms_history_a
    validates :avg_dms_history_b
    validates :avg_geography_a
    validates :avg_geography_b
    validates :avg_ctp_society
    validates :avg_ethics
    validates :avg_politics_n_economy
    validates :avg_ethics_n_politics_n_economy
    validates :avg_society
    validates :avg_listening
    validates :avg_reading
    validates :avg_english
    validates :avg_language
  end

  
  

  def initialize(attributes = nil, score: Score.new, average: Average.new, subject: Subject.new, tag: Tag.new)
    @score = score
    @average = average
    @subject = subject
    @tag = tag
    attributes ||= default_attributes
    super(attributes)
  end

  def update

    @score.update!(title: title, jpn_ctp: jpn_ctp, jpn_classic: jpn_classic, jpn_chinese: jpn_chinese, jpn: jpn,
      math_1_a: math_1_a, math_2_b: math_2_b, math_3_c: math_3_c, math_1_a: math_1_a, math_1: math_1, math_2: math_2, math_3: math_3, math_a: math_a, math_b: math_b, math_c: math_c, math: math,
      book_keep: book_keep, basic_info: basic_info,
      science_n_life: science_n_life, basic_physics: basic_physics, physics: physics, basic_chemistry: basic_chemistry, chemistry: chemistry, basic_earth_science: basic_earth_science, earth_science: earth_science, basic_biology: basic_biology, biology: biology, science: science,
      wld_history_a: wld_history_a, wld_history_b: wld_history_b, dms_history_a: dms_history_a, dms_history_b: dms_history_b, geography_a: geography_a, geography_b: geography_b, ctp_society: ctp_society, ethics: ethics, politics_n_economy: politics_n_economy, ethics_n_politics_n_economy: ethics_n_politics_n_economy, society: society, 
      listening: listening, reading: reading, english: english, language: language, review: review, user_id: user_id)
    
    @average.update!(avg_title: avg_title, avg_jpn_ctp: avg_jpn_ctp, avg_jpn_classic: avg_jpn_classic, avg_jpn_chinese: avg_jpn_chinese, avg_jpn: avg_jpn,
    avg_math_1_a: avg_math_1_a, avg_math_2_b: avg_math_2_b, avg_math_3_c: avg_math_3_c, avg_math_1_a: avg_math_1_a, avg_math_1: avg_math_1, avg_math_2: avg_math_2, avg_math_3: avg_math_3, avg_math_a: avg_math_a, avg_math_b: avg_math_b, avg_math_c: avg_math_c, avg_math: avg_math,
    avg_book_keep: avg_book_keep, avg_basic_info: avg_basic_info,
    avg_science_n_life: avg_science_n_life, avg_basic_physics: avg_basic_physics, avg_physics: avg_physics, avg_basic_chemistry: avg_basic_chemistry, avg_chemistry: avg_chemistry, avg_basic_earth_science: avg_basic_earth_science, avg_earth_science: avg_earth_science, avg_basic_biology: avg_basic_biology, avg_biology: avg_biology, avg_science: avg_science,
    avg_wld_history_a: avg_wld_history_a, avg_wld_history_b: avg_wld_history_b, avg_dms_history_a: avg_dms_history_a, avg_dms_history_b: avg_dms_history_b, avg_geography_a: avg_geography_a, avg_geography_b: avg_geography_b, avg_ctp_society: avg_ctp_society, avg_ethics: avg_ethics, avg_politics_n_economy: avg_politics_n_economy, avg_ethics_n_politics_n_economy: avg_ethics_n_politics_n_economy, avg_society: avg_society, 
    avg_listening: avg_listening, avg_reading: avg_reading, avg_english: avg_english, avg_language: avg_language, score_id: @score.id)

    @subject.update!(sub_jpn_ctp: sub_jpn_ctp, sub_jpn_classic: sub_jpn_classic, sub_jpn_chinese: sub_jpn_chinese, sub_jpn: sub_jpn,
    sub_math_1_a: sub_math_1_a, sub_math_2_b: sub_math_2_b, sub_math_3_c: sub_math_3_c, sub_math_1_a: sub_math_1_a, sub_math_1: sub_math_1, sub_math_2: sub_math_2, sub_math_3: sub_math_3, sub_math_a: sub_math_a, sub_math_b: sub_math_b, sub_math_c: sub_math_c, sub_math: sub_math,
    sub_book_keep: sub_book_keep, sub_basic_info: sub_basic_info,
    sub_science_n_life: sub_science_n_life, sub_basic_physics: sub_basic_physics, sub_physics: sub_physics, sub_basic_chemistry: sub_basic_chemistry, sub_chemistry: sub_chemistry, sub_basic_earth_science: sub_basic_earth_science, sub_earth_science: sub_earth_science, sub_basic_biology: sub_basic_biology, sub_biology: sub_biology, sub_science: sub_science,
    sub_wld_history_a: sub_wld_history_a, sub_wld_history_b: sub_wld_history_b, sub_dms_history_a: sub_dms_history_a, sub_dms_history_b: sub_dms_history_b, sub_geography_a: sub_geography_a, sub_geography_b: sub_geography_b, sub_ctp_society: sub_ctp_society, sub_ethics: sub_ethics, sub_politics_n_economy: sub_politics_n_economy, sub_ethics_n_politics_n_economy: sub_ethics_n_politics_n_economy, sub_society: sub_society, 
    sub_listening: sub_listening, sub_reading: sub_reading, sub_english: sub_english, sub_language: sub_language, score_id: @score.id)

    score_tag_relation = ScoreTagRelation.where(score_id: score_id, tag_id: tag_id)
    tag = Tag.find_or_create_by(tag_name: tag_name)
    score_tag_relation.update(score_id: @score.id, tag_id: tag.id)
    

  end
  

  private

  attr_reader :score, :average, :subject, :tag

  def default_attributes
    {
      avg_title: average.avg_title, avg_jpn_ctp: average.avg_jpn_ctp, avg_jpn_classic: average.avg_jpn_classic, avg_jpn_chinese: average.avg_jpn_chinese, avg_jpn: average.avg_jpn,
      avg_math_1_a: average.avg_math_1_a, avg_math_2_b: average.avg_math_2_b, avg_math_3_c: average.avg_math_3_c, avg_math_1_a: average.avg_math_1_a, avg_math_1: average.avg_math_1, avg_math_2: average.avg_math_2, avg_math_3: average.avg_math_3, avg_math_a: average.avg_math_a, avg_math_b: average.avg_math_b, avg_math_c: average.avg_math_c, avg_math: average.avg_math,
      avg_book_keep: average.avg_book_keep, avg_basic_info: average.avg_basic_info,
      avg_science_n_life: average.avg_science_n_life, avg_basic_physics: average.avg_basic_physics, avg_physics: average.avg_physics, avg_basic_chemistry: average.avg_basic_chemistry, avg_chemistry: average.avg_chemistry, avg_basic_earth_science: average.avg_basic_earth_science, avg_earth_science: average.avg_earth_science, avg_basic_biology: average.avg_basic_biology, avg_biology: average.avg_biology, avg_science: average.avg_science,
      avg_wld_history_a: average.avg_wld_history_a, avg_wld_history_b: average.avg_wld_history_b, avg_dms_history_a: average.avg_dms_history_a, avg_dms_history_b: average.avg_dms_history_b, avg_geography_a: average.avg_geography_a, avg_geography_b: average.avg_geography_b, avg_ctp_society: average.avg_ctp_society, avg_ethics: average.avg_ethics, avg_politics_n_economy: average.avg_politics_n_economy, avg_ethics_n_politics_n_economy: average.avg_ethics_n_politics_n_economy, avg_society: average.avg_society, 
      avg_listening: average.avg_listening, avg_reading: average.avg_reading, avg_english: average.avg_english, avg_language: average.avg_language,
      sub_jpn_ctp: subject.sub_jpn_ctp, sub_jpn_classic: subject.sub_jpn_classic, sub_jpn_chinese: subject.sub_jpn_chinese, sub_jpn: subject.sub_jpn,
      sub_math_1_a: subject.sub_math_1_a, sub_math_2_b: subject.sub_math_2_b, sub_math_3_c: subject.sub_math_3_c, sub_math_1_a: subject.sub_math_1_a, sub_math_1: subject.sub_math_1, sub_math_2: subject.sub_math_2, sub_math_3: subject.sub_math_3, sub_math_a: subject.sub_math_a, sub_math_b: subject.sub_math_b, sub_math_c: subject.sub_math_c, sub_math: subject.sub_math,
      sub_book_keep: subject.sub_book_keep, sub_basic_info: subject.sub_basic_info,
      sub_science_n_life: subject.sub_science_n_life, sub_basic_physics: subject.sub_basic_physics, sub_physics: subject.sub_physics, sub_basic_chemistry: subject.sub_basic_chemistry, sub_chemistry: subject.sub_chemistry, sub_basic_earth_science: subject.sub_basic_earth_science, sub_earth_science: subject.sub_earth_science, sub_basic_biology: subject.sub_basic_biology, sub_biology: subject.sub_biology, sub_science: subject.sub_science,
      sub_wld_history_a: subject.sub_wld_history_a, sub_wld_history_b: subject.sub_wld_history_b, sub_dms_history_a: subject.sub_dms_history_a, sub_dms_history_b: subject.sub_dms_history_b, sub_geography_a: subject.sub_geography_a, sub_geography_b: subject.sub_geography_b, sub_ctp_society: subject.sub_ctp_society, sub_ethics: subject.sub_ethics, sub_politics_n_economy: subject.sub_politics_n_economy, sub_ethics_n_politics_n_economy: subject.sub_ethics_n_politics_n_economy, sub_society: subject.sub_society, 
      sub_listening: subject.sub_listening, sub_reading: subject.sub_reading, sub_english: subject.sub_english, sub_language: subject.sub_language,
      title: score.title, jpn_ctp: score.jpn_ctp, jpn_classic: score.jpn_classic, jpn_chinese: score.jpn_chinese, jpn: score.jpn,
      math_1_a: score.math_1_a, math_2_b: score.math_2_b, math_3_c: score.math_3_c, math_1_a: score.math_1_a, math_1: score.math_1, math_2: score.math_2, math_3: score.math_3, math_a: score.math_a, math_b: score.math_b, math_c: score.math_c, math: score.math,
      book_keep: score.book_keep, basic_info: score.basic_info,
      science_n_life: score.science_n_life, basic_physics: score.basic_physics, physics: score.physics, basic_chemistry: score.basic_chemistry, chemistry: score.chemistry, basic_earth_science: score.basic_earth_science, earth_science: score.earth_science, basic_biology: score.basic_biology, biology: score.biology, science: score.science,
      wld_history_a: score.wld_history_a, wld_history_b: score.wld_history_b, dms_history_a: score.dms_history_a, dms_history_b: score.dms_history_b, geography_a: score.geography_a, geography_b: score.geography_b, ctp_society: score.ctp_society, ethics: score.ethics, politics_n_economy: score.politics_n_economy, ethics_n_politics_n_economy: score.ethics_n_politics_n_economy, society: score.society, 
      listening: score.listening, reading: score.reading, english: score.english, language: score.language, review: score.review,
      tag_name: tag.tag_name, score_id: score.id, 
    }
  end

  


end
