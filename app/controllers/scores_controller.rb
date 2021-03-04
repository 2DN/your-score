class ScoresController < ApplicationController
  require 'date'

  before_action :authenticate_user!, except: :top
  before_action :move_to_index, only: %i[edit update destroy]

  def top
    redirect_to action: :index if current_user
  end

  def index
    scores = Score.where(user_id: current_user.id).order(created_at: :desc)
    if scores.length > 0
      @score = scores[0]

      score_get_charted
    end

    today = Date.today
    days = []
    @tasks = Task.where(user_id: current_user.id)

    @tasks.each do |task|
      if task.limit_date - today >= 0
      days << task.limit_date
      end
    end
    if @tasks.length > 0
      coming_soon = days.min
      
      
        @task = Task.find_by(limit_date: coming_soon)
        @remain_days = (@task.limit_date - today).numerator
      
    end
  end

  def new
    @form = CreateScoreSubjectAverage.new
  end

  def create
    @form = CreateScoreSubjectAverage.new(create_params)
    if @form.validate
      @form.save
      redirect_to action: :my_scores
    else
      render :new
    end
  end

  def my_scores
    @scores = Score.where(user_id: current_user.id).order("created_at desc")
  end

  def show
    @score = Score.find(params[:id])

    score_get_charted
  end

  def edit
    @score = Score.find(params[:id])
    @average = Average.find(@score.id)
    @subject = Subject.find(@score.id)
    tag_name = @score.tags.pluck[0][1]
    @tag = Tag.find_by(tag_name: tag_name)

    @form = UpdateScoreSubjectAverage.new(score: @score, average: @average, subject: @subject, tag: @tag)
  end

  def update
    @score = Score.find(params[:id])
    @average = Average.find(@score.id)
    @subject = Subject.find(@score.id)
    tag_name = @score.tags.pluck[0][1]
    @tag = Tag.find_by(tag_name: tag_name)
    @form = UpdateScoreSubjectAverage.new(update_params, score: @score, average: @average, subject: @subject, tag: @tag)

    if @form.validate
      @form.update
      redirect_to my_scores_scores_path
    else
      render :edit
    end
  end

  def destroy
    @score = Score.find(params[:id])
    @score.destroy
    redirect_to scores_path
  end

  def show_transition
    @scores = Score.where(user_id: current_user.id)
    @tags_array_for_options = []
    @scores.each do |score|
      @tags_array_for_options << [score.score_tag_relations[0].tag.tag_name, score.score_tag_relations[0].tag.id]
    end
  end

  def search
    @tag = Tag.find(params[:id])
    @scores = @tag.scores.where(user_id: current_user.id)
    @total_scores_in_array = []
    @scores.each do |score|
      total_score = 0
      score.attributes.each do |k, v|
        if !v.nil? && k != 'id' && k != 'title' && k != 'review' && k != 'created_at' && k != 'updated_at' && k != 'user_id'
          total_score += v
        end
      end
      @total_scores_in_array << total_score
    end

    @averages = []
    @scores.each do |score|
      @averages << Average.find(score.id)
    end
    @total_avg_scores_in_array = []
    @averages.each do |average|
      total_avg_score = 0
      average.attributes.each do |k, v|
        total_avg_score += v if !v.nil? && k != 'id' && k != 'avg_title' && k != 'created_at' && k != 'updated_at'
      end
      @total_avg_scores_in_array << total_avg_score
    end

    render json: { scores: @total_scores_in_array, averages: @total_avg_scores_in_array }
  end

  private

  def score_get_charted
    color = %w[nil nil #e60012 #e5171f red #f62e36 #009bbf #00a7db #00ada9 #0079c2 #0078ba #00a0de dodgerblue lightblue aqua blue aquamarine teal
               #00bb85 #00ac9b forestgreen lime olive #009944 #6cbb5a #019a66 #a9cc51 green #ff9500 #c1a470 #f39700 #ee7b1a #9c5e31 #bb641d #814721 #e3acae marron
               #bb5535 #e29676 #8f76d6 #9b7cb6 #e85298 #e44d93 nil nil nil nil]

    @array_score = []
    @array_color = []
    @total_score = 0
    i = 0
    @score.attributes.each do |k, v|
      if !v.nil? && k != 'id' && k != 'title' && k != 'review' && k != 'created_at' && k != 'updated_at' && k != 'user_id'
        @array_score << v
        @array_color << color[i]
        @total_score += v
      end
      i += 1
    end

    gon.array_color = @array_color
    gon.array_score = @array_score

    # インスタンス変数----------AVERAGE----------AVERAGE----------AVERAGE----------
    @average = Average.find(@score.id)

    @array_average = []
    @total_avg_score = 0
    @average.attributes.each do |k, v|
      if !v.nil? && k != 'id' && k != 'avg_title' && k != 'created_at' && k != 'updated_at' && k != 'score_id'
        @array_average << v
        @total_avg_score += v
      end
    end

    gon.array_average = @array_average

    # インスタンス変数----------SUBJECT----------SUBJECT----------SUBJECT----------
    @subject = Subject.find(@score.id)

    @array_subject = []
    @subject.attributes.each do |k, v|
      @array_subject << v if k != 'id' && k != 'created_at' && k != 'updated_at' && v != '0' && k != 'score_id'
    end

    gon.array_subject = @array_subject
  end

  def create_params
    params.require(:create_score_subject_average).permit(:title, :jpn_ctp, :jpn_classic, :jpn_chinese, :jpn,
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
                                                         :sub_listening, :sub_reading, :sub_english, :sub_language, :tag_name).merge(user_id: current_user.id)
  end

  def update_params
    params.require(:update_score_subject_average).permit(:title, :jpn_ctp, :jpn_classic, :jpn_chinese, :jpn,
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
                                                         :sub_listening, :sub_reading, :sub_english, :sub_language, :tag_name).merge(user_id: current_user.id, score_id: @score.id, tag_id: @tag.id)
  end

  def move_to_index
    @score = Score.find(params[:id])
    redirect_to root_path if @score.user != current_user
  end
end
