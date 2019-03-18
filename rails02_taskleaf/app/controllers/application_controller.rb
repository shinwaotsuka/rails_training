class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user
  before_action :login_required

  private
  def current_user
    if session[:user_id]
      # @current_userが未定義の場合のみ設定する
      @current_user ||= User.find_by(id: session[:user_id]) 
    end
  end

  def login_required
    if !current_user
      redirect_to login_path
    end
  end
end
