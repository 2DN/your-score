class ScoresController < ApplicationController
  before_action :authenticate_user!
  def index
  end

  def new
    @score_subject_average = ScoreSubjectAverage.new
  end

  def create
    @score_subject_average = ScoreSubjectAverage.new(mixed_params)
    @score_subject_average.save
    redirect_to action: :new
  end

  def my_scores
    @scores = Score.where(user_id: current_user.id)
  end

  def show
    @score = Score.find(params[:id])

    hash_score = { title: @score.title, jpn_ctp: @score.jpn_ctp, jpn_classic: @score.jpn_classic, jpn_chinese: @score.jpn_chinese, jpn: @score.jpn,
      math_1_a: @score.math_1_a, math_2_b: @score.math_2_b, math_3_c: @score.math_3_c, math_1_a: @score.math_1_a, math_1: @score.math_1, math_2: @score.math_2, math_3: @score.math_3, math_a: @score.math_a, math_b: @score.math_b, math_c: @score.math_c, math: @score.math,
      book_keep: @score.book_keep, basic_info: @score.basic_info,
      science_n_life: @score.science_n_life, basic_physics: @score.basic_physics, physics: @score.physics, basic_chemistry: @score.basic_chemistry, chemistry: @score.chemistry, basic_earth_science: @score.basic_earth_science, earth_science: @score.earth_science, basic_biology: @score.basic_biology, biology: @score.biology, science: @score.science,
      wld_history_a: @score.wld_history_a, wld_history_b: @score.wld_history_b, dms_history_a: @score.dms_history_a, dms_history_b: @score.dms_history_b, geography_a: @score.geography_a, geography_b: @score.geography_b, ctp_society: @score.ctp_society, ethics: @score.ethics, politics_n_economy: @score.politics_n_economy, ethics_n_politics_n_economy: @score.ethics_n_politics_n_economy, society: @score.society, 
      listening: @score.listening, reading: @score.reading, english: @score.english, language: @score.language, review: @score.review }

    @array_score = []
    hash_score.each_value do |v|
      if v != nil
        @array_score << v
      end
    end

    @average = Average.find(@score.average_id)

    hash_average = { avg_jpn_ctp: @average.avg_jpn_ctp, avg_jpn_classic: @average.avg_jpn_classic, avg_jpn_chinese: @average.avg_jpn_chinese, avg_jpn: @average.avg_jpn,
      avg_math_1_a: @average.avg_math_1_a, avg_math_2_b: @average.avg_math_2_b, avg_math_3_c: @average.avg_math_3_c, avg_math_1_a: @average.avg_math_1_a, avg_math_1: @average.avg_math_1, avg_math_2: @average.avg_math_2, avg_math_3: @average.avg_math_3, avg_math_a: @average.avg_math_a, avg_math_b: @average.avg_math_b, avg_math_c: @average.avg_math_c, avg_math: @average.avg_math,
      avg_book_keep: @average.avg_book_keep, avg_basic_info: @average.avg_basic_info,
      avg_science_n_life: @average.avg_science_n_life, avg_basic_physics: @average.avg_basic_physics, avg_physics: @average.avg_physics, avg_basic_chemistry: @average.avg_basic_chemistry, avg_chemistry: @average.avg_chemistry, avg_basic_earth_science: @average.avg_basic_earth_science, avg_earth_science: @average.avg_earth_science, avg_basic_biology: @average.avg_basic_biology, avg_biology: @average.avg_biology, avg_science: @average.avg_science,
      avg_wld_history_a: @average.avg_wld_history_a, avg_wld_history_b: @average.avg_wld_history_b, avg_dms_history_a: @average.avg_dms_history_a, avg_dms_history_b: @average.avg_dms_history_b, avg_geography_a: @average.avg_geography_a, avg_geography_b: @average.avg_geography_b, avg_ctp_society: @average.avg_ctp_society, avg_ethics: @average.avg_ethics, avg_politics_n_economy: @average.avg_politics_n_economy, avg_ethics_n_politics_n_economy: @average.avg_ethics_n_politics_n_economy, avg_society: @average.avg_society, 
      avg_listening: @average.avg_listening, avg_reading: @average.avg_reading, avg_english: @average.avg_english, avg_language: @average.avg_language }
    
    @array_average = []
    hash_average.each_value do |v|
      if v != nil
        @array_average << v
      end
    end

    @subject = Subject.find(@score.subject_id)

    hash_subject = { sub_jpn_ctp: @subject.sub_jpn_ctp, sub_jpn_classic: @subject.sub_jpn_classic, sub_jpn_chinese: @subject.sub_jpn_chinese, sub_jpn: @subject.sub_jpn,
      sub_math_1_a: @subject.sub_math_1_a, sub_math_2_b: @subject.sub_math_2_b, sub_math_3_c: @subject.sub_math_3_c, sub_math_1_a: @subject.sub_math_1_a, sub_math_1: @subject.sub_math_1, sub_math_2: @subject.sub_math_2, sub_math_3: @subject.sub_math_3, sub_math_a: @subject.sub_math_a, sub_math_b: @subject.sub_math_b, sub_math_c: @subject.sub_math_c, sub_math: @subject.sub_math,
      sub_book_keep: @subject.sub_book_keep, sub_basic_info: @subject.sub_basic_info,
      sub_science_n_life: @subject.sub_science_n_life, sub_basic_physics: @subject.sub_basic_physics, sub_physics: @subject.sub_physics, sub_basic_chemistry: @subject.sub_basic_chemistry, sub_chemistry: @subject.sub_chemistry, sub_basic_earth_science: @subject.sub_basic_earth_science, sub_earth_science: @subject.sub_earth_science, sub_basic_biology: @subject.sub_basic_biology, sub_biology: @subject.sub_biology, sub_science: @subject.sub_science,
      sub_wld_history_a: @subject.sub_wld_history_a, sub_wld_history_b: @subject.sub_wld_history_b, sub_dms_history_a: @subject.sub_dms_history_a, sub_dms_history_b: @subject.sub_dms_history_b, sub_geography_a: @subject.sub_geography_a, sub_geography_b: @subject.sub_geography_b, sub_ctp_society: @subject.sub_ctp_society, sub_ethics: @subject.sub_ethics, sub_politics_n_economy: @subject.sub_politics_n_economy, sub_ethics_n_politics_n_economy: @subject.sub_ethics_n_politics_n_economy, sub_society: @subject.sub_society, 
      sub_listening: @subject.sub_listening, sub_reading: @subject.sub_reading, sub_english: @subject.sub_english, sub_language: @subject.sub_language }

    @array_subject = []
    hash_subject.each_value do |v|
      if v != "0"
      @array_subject << v
      end
    end

    

    
    

  end

  private

  def mixed_params
    params.require(:score_subject_average).permit(:title, :jpn_ctp, :jpn_classic, :jpn_chinese, :jpn,
      :math_1_a, :math_2_b, :math_3_c, :math_1_a, :math_1, :math_2, :math_3, :math_a, :math_b, :math_c, :math,
      :book_keep, :basic_info,
      :science_n_life, :basic_physics, :physics, :basic_chemistry, :chemistry, :basic_earth_science, :earth_science, :basic_biology, :biology, :science,
      :wld_history_a, :wld_history_b, :dms_history_a, :dms_history_b, :geography_a, :geography_b, :ctp_society, :ethics, :politics_n_economy, :ethics_n_politics_n_economy, :society,
      :listening, :reading, :english, :language, :review,
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
      :sub_listening, :sub_reading, :sub_english, :sub_language).merge(user_id: current_user.id)
  end

end
