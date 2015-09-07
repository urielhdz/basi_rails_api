json.array!(@users) do |user|
  json.extract! user, :id, :nombre, :direccion, :username, :encrypted_password
  json.url user_url(user, format: :json)
end
