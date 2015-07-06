class Store < ActiveRecord::Base
	validates :email, presence: true, uniqueness: true
	validates :name, presence: true

	has_secure_password
	has_one :api_token
	has_many :receipts
	
	def self.confirm(params)
    @store = Store.find_by({email: params[:email]})
    @store.try(:authenticate, params[:password])
  end
end
