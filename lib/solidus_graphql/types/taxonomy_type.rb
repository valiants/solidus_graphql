module Solidus
  module GraphQL
    TaxonomyType = ::GraphQL::ObjectType.define do
      name "Taxonomy"

      field :id,          types.ID
      field :name,        types.String
      field :position,    types.Int
    end
  end
end
