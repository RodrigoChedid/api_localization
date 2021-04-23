class LocalSerializer < ActiveModel::Serializer
  attributes :id, :cep, :address, :number, :state, :city, :district, :lat, :lon
  has_one :user
end
