module Solidus
  module GraphQL
    TaxonomiesField = ::GraphQL::Field.define do
      name "taxonomies"
      description "Taxonomies list"

      argument :ids, types[types.ID]

      type types[TaxonomyType]

      resolve TaxonomyResolver::All
    end
  end
end
