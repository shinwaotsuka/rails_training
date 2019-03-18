class Admin::UsersController < ApplicationController
  before_action :require_admin
  before_action :set_user, only: [:show,:edit,:update,:destroy]

  def index
    @users = User.all
  end

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    logger.debug @user.inspect
    # logger.debug @user.to_yaml
    if @user.save
      redirect_to admin_user_path(@user), notice: "ユーザ「#{@user.name}」を登録しました。"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to admin_user_path(@user), notice:"更新しました"
    else
      render :new
    end
  end

  def destroy
    puts '削除しますよ'
    puts @user.inspect
    @user.destroy
    redirect_to admin_users_url,notice:"#{@user.name}を削除しました"
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :admin, :password, :password_confirmation)
  end

  # 管理者ユーザ以外ははじく
  def require_admin
    # これをいれるとエラーになるので、一旦コメントアウト
    # redirect_to root_path unless current_user.admin?
  end

  def set_user
    @user = User.find(params[:id])
  end

  

end
