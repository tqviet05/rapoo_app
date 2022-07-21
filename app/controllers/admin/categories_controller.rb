class Admin::CategoriesController < AdminController
  def index
    operator = Admin::Categories::IndexOperation.new(params)
    operator.perform
    @q = operator.q
    @categories = operator.categories
  end

  def edit
    operator = Admin::Categories::EditOperation.new(params)
    operator.perform
    @category = operator.category
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
  end

  def new
    operator = Admin::Categories::NewOperation.new
    operator.perform
    @category = operator.category
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
  end

  def destroy
    operator = Admin::Categories::DestroyOperation.new(params)
    operator.perform
    redirect_back fallback_location: request.referrer
  end
end
