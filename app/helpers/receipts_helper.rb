module ReceiptsHelper

	def get_store(api_key)
		api_record = ApiToken.find_by(hex_value: api_key)
		store = Store.find(api_record.store_id)
		return store
	end
end
