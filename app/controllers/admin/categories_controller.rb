class Admin::CategoriesController < AdminController
  def index
    @q = Category.all.order(:position).ransack(params[:q])
    @categories = @q.result.page(params[:page]).per(20)
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    category = Category.find_by(id: params[:id])
    category.update( category_params)
    redirect_to admin_categories_path
  end

  def new
    @category = Category.new

  end

  def create
    # param = params.require(:category).permit(:email, :password, :password_confirmation)
    category = Category.create(category_params)
    redirect_to admin_categories_path

  end

  def destroy
    Category.find(params[:id]).destroy!
    redirect_to request.referrer || admin_categories_path
  end

  private

  def category_params
    params.require(:category).permit(:position, :name)
  end
end
