class Admin::GiftsController < Admin::BaseController
  layout "admin"
  before_action :set_gift, only: %i[show edit update destroy]

  def index
    @gifts = Gift.order(:name)
  end

  def show; end

  def new
    @gift = Gift.new
  end

  def edit; end

  def create
    @gift = Gift.new(gift_params)

    if @gift.save
      redirect_to admin_gift_path(@gift), notice: "Presente criado com sucesso."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @gift.update(gift_params)
      redirect_to admin_gift_path(@gift), notice: "Presente atualizado com sucesso."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @gift.destroy
    redirect_to admin_gifts_path, notice: "Presente removido com sucesso."
  end

  private

  def set_gift
    @gift = Gift.find(params[:id])
  end

  def gift_params
    params.require(:gift).permit(:name, :price, :image_url, :description)
  end
end
