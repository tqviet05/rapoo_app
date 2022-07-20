class Admin::CategoriesController < AdminController
  def index
    operator = Admin::Categories::IndexOperation.new(params)
    operator.perform
    @q = operator.q
    @categories = operator.categories
<<<<<<< HEAD
=======

    # @q = Category.all.order(:position).ransack(params[:q])
    # @categories = @q.result.page(params[:page]).per(20)
>>>>>>> admin categories page DONE
  end

  def edit
    operator = Admin::Categories::EditOperation.new(params)
    operator.perform
    @category = operator.category
<<<<<<< HEAD
=======
    # @category = Category.find(params[:id])
>>>>>>> admin categories page DONE
  end

  def update
    operator = Admin::Categories::UpdateOperation.new(params)
    operator.perform
    @errors = operator.errors
    if @errors.blank?
      redirect_to admin_categories_path, notice: 'Category updated successfully.'
    else
      @category = operator.category
      render :edit
    end

    # @category = Category.find_by(id: params[:id])
    # if @category.update( category_params)
    # redirect_to admin_categories_path, notice: 'Category updated successfully.'
    # else
    #   render :edit
    # end
  end

  def new
    operator = Admin::Categories::NewOperation.new
    operator.perform
    @category = operator.category
<<<<<<< HEAD
=======
    
    # @category = Category.new
>>>>>>> admin categories page DONE
  end

  def create
    operator = Admin::Categories::CreateOperation.new(params)
    operator.perform
    @errors = operator.errors
    if @errors.blank?
      redirect_to admin_categories_path, notice: 'Category was successfully created.'
    else
      @category = operator.category
      render :new
    end
<<<<<<< HEAD
=======

    # @category = Category.new(category_params)
    # if @category.save
    #   redirect_to admin_categories_path, notice: 'Category was successfully created.'
    # else
    #   render :new
    # end

>>>>>>> admin categories page DONE
  end

  def destroy
    operator = Admin::Categories::DestroyOperation.new(params)
    operator.perform
    redirect_back fallback_location: request.referrer
<<<<<<< HEAD
  end
=======

    # Category.find(params[:id]).destroy!
    # redirect_to request.referrer || admin_categories_path
  end

  # private

  # def category_params
  #   params.require(:category).permit(:position, :name)
  # end
>>>>>>> admin categories page DONE
end
