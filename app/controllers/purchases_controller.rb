class PurchasesController < ApplicationController
  before_action :authenticate_user!

  # GET /purchases/1
  # GET /purchases/1.json
  def show
    @purchase = @current_user.purchases.find_by(purchases: { id: params[:id] })
    if @purchase.nil?
      render json: "Purchases not found", status: 404
    end
  end

  # POST /purchases
  # POST /purchases.json
  def create
    @purchase = @current_user.purchases.new(purchase_params)

    if @purchase.save
      render :show
    else
      render json: @purchase.errors, status: :unprocessable_entity
    end
  end

  

  private

    def set_purchase
      @purchase = Purchase.find(params[:id])
    end

    def purchase_params
      params.require(:purchase).permit(:product_id)
    end
end
