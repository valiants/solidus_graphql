module Solidus
  module GraphQL
    VariantType = ::GraphQL::ObjectType.define do
      name "Variant"

      field :id,   types.ID
      field :sku,  types.String
      field :name, types.String
    end
  end
end
