class Admin::BannersController < AdminController
  def index
    @q = Banner.all.order(:id).ransack(params[:q])
    @banners = @q.result.page(params[:page]).per(20)
  end

  # def edit
  #   @banner = Banner.find(params[:id])
  # end

  # def update
  #   banner = Banner.find_by(id: params[:id])
  #   Banner.update( banner_params)
  #   redirect_to admin_banners_path
  # end

  def new
    @banner = Banner.new

  end

  def create
    banner = Banner.create(banner_params)
    redirect_to admin_banners_path

  end

  def destroy
    Banner.find(params[:id]).destroy!
    redirect_to request.referrer || admin_banners_path
  end

  private

  def banner_params
    params.require(:banner).permit(:id, :image)
  end
end
