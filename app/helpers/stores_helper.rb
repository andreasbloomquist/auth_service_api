module StoresHelper
	require 'securerandom'

	def generate_api_key
		api_key = SecureRandom.uuid
		store = current_store.id
		token = ApiToken.create(store_id: store, hex_value: api_key)
	end

	def reset_api_token
		@store = Store.find(params[:id])
		new_key = SecureRandom.uuid
		@store.api_token.update_attribute(:hex_value, new_key)
	end

end
