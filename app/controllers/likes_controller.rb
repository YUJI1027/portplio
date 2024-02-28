class LikesController < ApplicationController

  def create
    @like = current_user.likes.create(task_id: params[:task_id])
    redirect_to tasks_path
  end

  def destroy
    @task = Task.find(params[:task_id])
    @like = current_user.likes.find_by(task_id: @task.id)
    @like.destroy
    redirect_to tasks_path
  end
end
