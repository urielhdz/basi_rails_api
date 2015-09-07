json.purchase do
	json.extract! @purchase, :id, :created_at, :updated_at
	json.product do
		json.extract! @purchase.product, :id, :nombre, :precio
	end
	json.user do
		json.extract! @purchase.user, :id, :username, :direccion, :nombre
	end
end
