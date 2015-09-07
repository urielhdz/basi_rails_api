# == Schema Information
#
# Table name: products
#
#  id          :integer          not null, primary key
#  nombre      :string
#  descripcion :string
#  precio      :integer
#  url_imagen  :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Product < ActiveRecord::Base
end
