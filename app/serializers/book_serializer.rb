class BookSerializer < ActiveModel::Serializer
  attributes :id, :name, :author, :description, :edition, :quantity, :user_id
end

