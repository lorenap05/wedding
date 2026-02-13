class Admin::BaseController < ApplicationController
  before_action :require_admin

  private

  def require_admin
    return if current_admin

    redirect_to admin_login_path, alert: "Faça login para acessar o painel."
  end

  def current_admin
    @current_admin ||= AdminUser.find_by(id: session[:admin_user_id])
  end
  helper_method :current_admin
end
