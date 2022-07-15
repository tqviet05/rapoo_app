class ApplicationOperation
  attr_reader :form
  attr_reader :errors
  attr_reader :params
  attr_reader :current_user

  def initialize(params = {})
    @params = params
  end

  def assignment_error
    @errors = @form.errors
  end

  def build_ransack
    @q = Product.ransack(params[:q])
  end

end
