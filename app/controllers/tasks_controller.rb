class TasksController < ApplicationController
  before_action :authenticate_user!
  before_action :find_task, only: %i[edit update destroy]
  before_action :move_to_index, only: %i[edit update destroy]

  def index
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.validate
      @task.save
      redirect_to action: :index
    else
      render :my_tasks
    end
  end

  def my_tasks
    @tasks = Task.where(user_id: current_user.id).order('limit_date asc')
    if @tasks.length == 0
      redirect_to action: :index
    end
    
  end

  def edit; end

  def update
    if @task.validate
      @task.update(task_params)
      redirect_to action: :my_tasks
    else
      render :edit
    end
  end

  def destroy
    if @task.destroy
      redirect_to action: :my_tasks
    else
      render :my_tasks
    end
  end

  private

  def task_params
    params.require(:task).permit(:task_title, :memo, :limit_date).merge(user_id: current_user.id)
  end

  def find_task
    @task = Task.find(params[:id])
  end

  def move_to_index
    @task = Task.find(params[:id])
    redirect_to tasks_path if @task.user != current_user
  end
end
