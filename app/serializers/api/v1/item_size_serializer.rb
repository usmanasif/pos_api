class Api::V1::ItemSizeSerializer < ActiveModel::Serializer
  attributes :code, :price, :quantity, :discount, :size_attributes

  def size_attributes
    { size_type: object.size.size_type }
  end
end
