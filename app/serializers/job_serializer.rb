class JobSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :company_name, :url,
             :location, :created_at, :company_id, :created_at
  has_one :category
end
