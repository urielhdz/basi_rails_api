class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :nombre
      t.string :descripcion
      t.integer :precio
      t.string :url_imagen

      t.timestamps null: false
    end
  end
end
