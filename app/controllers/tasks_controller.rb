class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit]
  
  def index
    @tasks = current_user.tasks
  end

  def show
  end

  def new
    @task = Task.new
  end

  def create
    @task = current_user.tasks.new(task_params)
    if @task.save
      #flash message
      redirect_to accounts_path
    else
      #flash message
      render :new
    end
  end

  def edit
  end

  private

  def set_task
    @task = current_user.tasks.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:name, :description)
  end

end

