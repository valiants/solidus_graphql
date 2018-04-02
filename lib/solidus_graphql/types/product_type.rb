module Solidus
  module GraphQL
    ProductType = ::GraphQL::ObjectType.define do
      name "Product"

      field :id,          types.ID
      field :name,        types.String
      field :description, types.String
      field :master,      VariantType
      field :slug,        types.String

      connection :variants, VariantType.connection_type do
        resolve VariantResolver::ByProduct
      end
    end
  end
end
