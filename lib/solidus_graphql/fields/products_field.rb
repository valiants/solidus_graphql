module Solidus
  module GraphQL
    ProductsField = ::GraphQL::Field.define do
      name          "products"
      description   "List of all products"

      argument :ids,   types[types.ID], default_value: []
      argument :slugs, types.String,    default_value: []

      type types[ProductType]

      resolve ProductResolver::All
    end
  end
end
