class Admin::SessionsController < ApplicationController
  layout "admin"

  def new; end

  def create
    admin = AdminUser.find_by(email: params[:email])

    if admin&.authenticate(params[:password])
      session[:admin_user_id] = admin.id
      redirect_to admin_root_path, notice: "Login realizado com sucesso."
    else
      flash.now[:alert] = "E-mail ou senha inválidos."
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    reset_session
    redirect_to admin_login_path, notice: "Sessão encerrada."
  end
end
