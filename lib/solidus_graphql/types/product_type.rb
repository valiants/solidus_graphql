module Solidus
  module Graphql
    ProductType = ::GraphQL::ObjectType.define do
      name "Product"

      field :id,          !types.ID
      field :name,        !types.String
      field :description, !types.String
      field :slug,        !types.String
    end
  end
end
