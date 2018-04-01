module Solidus
  module Graphql
    QueryType = ::GraphQL::ObjectType.define do
      name "Query"
      description "The query root of the schema"

      field :products, ProductsField
    end
  end
end
