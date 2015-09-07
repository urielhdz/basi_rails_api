json.product do
	json.extract! @product, :id, :nombre, :descripcion, :precio, :url_imagen, :created_at, :updated_at
end
