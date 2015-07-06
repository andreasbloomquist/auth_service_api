class ReceiptsController < ApplicationController
	include ReceiptsHelper
	skip_before_filter :verify_authenticity_token
	before_filter :restrict_access
  
  def index
  	store = get_store(params[:api_token])
		@receipts = store.receipts
		respond_to do |format|
			format.json { render json: @receipts }
		end
  end

  def create
		@store = get_store(params[:api_token])
		@params = receipt_params
		@receipt = @store.receipts.create(@params)
	end

  private
    def restrict_access
      api_key = ApiToken.find_by_hex_value(params[:api_token])
      head :unauthorized unless api_key
    end

    def receipt_params
      params.require(:receipt).permit(:transaction_number, :payment_method, :subtotal, :tip, :total, :customer_info, :items, :item_count, :taxes, :tender_amount, :change_due)
    end
end

{"transaction_number":"12345677899","payment_method":"amex 1234","subtotal":10,"tip":2,"taxes":1,"total":13,"customer_info":{"first_name":"Andreas","last_name":"Bloomquist","member_id":1},"items":[{"sku":"ABC123","description":"Super Computer","upc":"012345678901","serial_number":"123ABC123","price":"1000.00","taxcode":"A"},{"sku":"CDE456","description":"t-shirt","upc":"222333222333","price":"12.00","qty":"4","taxcode":"A"}],"item_count":2,"tender_amount":20,"change_due":7}
