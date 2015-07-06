class ApiToken < ActiveRecord::Base
	belongs_to :store

	validates :hex_value, uniqueness: true, presence: true
end
