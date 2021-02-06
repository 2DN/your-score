class ScoresController < ApplicationController

  before_action :authenticate_user!

  def index
    scores = Score.includes(:user).order(created_at: :desc)
    @score = scores[0]
    # ↓ A method creating charts.
    score_get_charted
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
    # ↓ A method creating charts.
    score_get_charted
  end

  def show_transition
    @user = User.find(current_user.id)
    @tag_names_array_for_options = []
    @user_tag_relations = @user.user_tag_relations
    @user_tag_relations.each do |user_tag|
      @tag_names_array_for_options << [user_tag.tag.tag_name, user_tag.tag.id]
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
      :sub_listening, :sub_reading, :sub_english, :sub_language, :tag_name).merge(user_id: current_user.id)
  end

  def score_get_charted

    color = ["black", "dimgray", "gray", "darkgray", "silver", "lightgray", "midnightblue", "navy", "darkblue", "blue", "dodgerblue", "lightblue", "aqua", "cadetblue", "aquamarine", "teal",
      "green", "darkgreen", "forestgreen", "lime", "olive", "yellow", "gold", "orange", "maroon", "darkred", "red", "brown", "pink", "deeppink", "violet", "plum", "magenta", "orchid","darkviolet",
      "purple", "indigo", "blueviolet", "fuchsia", "slateblue", "white", "orange", "orange", "black" ]

    @array_score = []
    @array_color = []
    @total_score = 0
    i = 0
    @score.attributes.each do |k, v|
      if v != nil && k != "id" && k != "title" && k != "review" && k != "created_at" && k != "updated_at" &&  k != "user_id" && k != "subject_id" && k != "average_id"
        @array_score << v
        @array_color << color[i]
        @total_score += v
      end
      i = i + 1
    end

    gon.array_color = @array_color
    gon.array_score = @array_score

    # インスタンス変数----------AVERAGE----------AVERAGE----------AVERAGE----------
    @average = Average.find(@score.average_id)
    
    
    @array_average = []
    @total_avg_score = 0
    @average.attributes.each do |k, v|
      if v != nil &&  k != "id" && k != "avg_title" && k != "created_at" && k != "updated_at" 
        @array_average << v
        @total_avg_score += v
      end
    end

    gon.array_average = @array_average

    # インスタンス変数----------SUBJECT----------SUBJECT----------SUBJECT----------
    @subject = Subject.find(@score.subject_id)

    @array_subject = []
    @subject.attributes.each do |k, v|
      if k != "id" && k != "created_at" && k != "updated_at" && v != "0"
      @array_subject << v
      end
    end

    gon.array_subject = @array_subject
  
  end

end
