class RapooAppController < ApplicationController
  def index
    @prod = Product.all.take(6)
  end

  def details

  end
  def login
    
  end
end
