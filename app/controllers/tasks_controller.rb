class TasksController < ApplicationController
  before_action :set_task, only: [:edit, :update, :destroy]

  def index
    if params[:title_key]
      @tasks = Task.where('title LIKE ?', "%#{params[:title_key]}%")
    else
      @tasks = Task.all
    end
  end

  def new
    @task = Task.new 
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to tasks_path
    else
      render 'new'
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    if @task.update(task_params)
      redirect_to tasks_path
    else
      render 'edit'
    end
  end

  def destroy
    @task.destroy
    redirect_to tasks_path
  end

  private
  def task_params
    params.require(:task).permit(:title, :content)
  end

  def set_task
    @task = Task.find(params[:id])
  end
end
