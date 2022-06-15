class ProductAttachmentsController < ApplicationController
  before_action :set_product_attachment, only: %i[ show edit update destroy ]

  # GET /product_attachments or /product_attachments.json
  def index
    @product_attachments = ProductAttachment.all
  end

  # GET /product_attachments/1 or /product_attachments/1.json
  def show
  end

  # GET /product_attachments/new
  def new
    @product_attachment = ProductAttachment.new
  end

  # GET /product_attachments/1/edit
  def edit
  end

  # POST /product_attachments or /product_attachments.json
  def create
    @product_attachment = ProductAttachment.new(product_attachment_params)

    respond_to do |format|
      if @product_attachment.save
        format.html { redirect_to product_attachment_url(@product_attachment), notice: "Product attachment was successfully created." }
        format.json { render :show, status: :created, location: @product_attachment }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @product_attachment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /product_attachments/1 or /product_attachments/1.json
  def update
    respond_to do |format|
      if @product_attachment.update(product_attachment_params)
        format.html { redirect_to product_attachment_url(@product_attachment), notice: "Product attachment was successfully updated." }
        format.json { render :show, status: :ok, location: @product_attachment }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @product_attachment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /product_attachments/1 or /product_attachments/1.json
  def destroy
    @product_attachment.destroy

    respond_to do |format|
      format.html { redirect_to product_attachments_url, notice: "Product attachment was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product_attachment
      @product_attachment = ProductAttachment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def product_attachment_params
      params.require(:product_attachment).permit(:product_id, :image)
    end
end
