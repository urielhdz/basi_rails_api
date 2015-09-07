json.user do
	json.extract! @user, :id, :nombre, :direccion, :username, :token, :created_at, :updated_at
end
