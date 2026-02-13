class Admin::SettingsController < Admin::BaseController
  layout "admin"

  def edit
    @admin_user = current_admin
  end

  def update
    @admin_user = current_admin

    if @admin_user.authenticate(settings_params[:current_password]) && @admin_user.update(password_params)
      redirect_to edit_admin_settings_path, notice: "Senha atualizada com sucesso."
    else
      flash.now[:alert] = "Não foi possível atualizar a senha. Verifique a senha atual e os campos preenchidos."
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def settings_params
    params.require(:admin_user).permit(:current_password, :password, :password_confirmation)
  end

  def password_params
    settings_params.slice(:password, :password_confirmation)
  end
end
