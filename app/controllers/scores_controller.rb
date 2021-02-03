class ScoresController < ApplicationController
  before_action :authenticate_user!
  def index
  end

  def new
    @score_subject_average = ScoreSubjectAverage.new
  end

  def create
  end

end
