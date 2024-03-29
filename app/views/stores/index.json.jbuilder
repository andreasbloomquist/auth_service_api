json.array!(@stores) do |store|
  json.extract! store, :id, :name, :email, :password_digest
  json.url store_url(store, format: :json)
end
