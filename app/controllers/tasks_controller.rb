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
    @task.user_id = current_user.id

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
    if @task.user_id == current_user.id
      if @task.update(task_params)
        redirect_to tasks_path
      else
        render 'edit'
      end
    else
      redirect_to tasks_path
    end
  end

  def destroy
    if @task.user_id == current_user.id
      @task.destroy
      redirect_to tasks_path
    end
  end

  private
  def task_params
    params.require(:task).permit(:title, :content, :user_id)
  end

  def set_task
    @task = Task.find(params[:id])
  end
end
