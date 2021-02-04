class TasksController < ApplicationController
  def index
    @task = Task.new
  end

  def create
    binding.pry
    @task = Task.new(task_params)
    if @task.save
      redirect_to action: :index
    else
      render :index
    end
  end

  private

  def task_params
    params.require(:task).permit(:task_title, :memo, :limit_date).merge(user_id: current_user.id)
  end


end
