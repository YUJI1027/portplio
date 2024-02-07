class UsersController < ApplicationController

  def new
    @user_new = User.new
  end

  def show
  end

  def edit
  end

  def create
    @user_new = User.new(user_params)
        
    if @user_new.save
        settion[:user_id] = @usre_new.id
        flash.now[:notice] = "ユーザーの新規登録に成功しました。"
        redirect_to tasks_path
    else
        flash[:alert] = "ユーザーの新規登録に失敗しました。"
        render "new"
    end
  end

  def update
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end
