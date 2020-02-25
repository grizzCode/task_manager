class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  
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
      redirect_to tasks_path
    else
      #flash message
      render :new
    end
  end

  def edit
  end
  
  def update
    if @task.update(task_params)
      #flash message
      redirect_to tasks_path
    else
      #flash message
      render :edit
    end
  end

  def destroy
    if @task.destroy
      #flash message
      redirect_to tasks_path
    else
      #flash message
      render :new
    end
  end

  private

  def set_task
    @task = current_user.tasks.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :description)
  end

end

