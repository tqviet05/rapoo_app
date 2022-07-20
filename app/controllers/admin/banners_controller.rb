class Admin::BannersController < AdminController
  def index
    operator = Admin::Banners::IndexOperation.new(params)
    operator.perform
    @q = operator.q
    @banners = operator.banners
  end

  def new
    operator = Admin::Banners::NewOperation.new(params)
    operator.perform
    @banner = operator.banner
  end

  def create
    operator = Admin::Banners::CreateOperation.new(params)
    operator.perform
    @errors = operator.errors
    if @errors.blank?
<<<<<<< HEAD
      redirect_to admin_banners_path, notice: 'Banners was successfully created.'
=======
      redirect_back fallback_location: request.referrer, notice: 'Banners was successfully created.'
>>>>>>> admin banner page DONE
    else
      @banner = operator.banner
      render :new
    end
  end

  def destroy
    operator = Admin::Banners::DestroyOperation.new(params)
    operator.perform
    redirect_back fallback_location: request.referrer || admin_banners_path
  end

  private

  def banner_params
    params.merge!(banner: { image: nil }) if params[:banner].blank?
    params.require(:banner).permit(:image)
  end
end
