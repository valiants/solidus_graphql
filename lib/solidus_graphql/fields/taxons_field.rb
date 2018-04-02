module Solidus
  module GraphQL
    TaxonsField = ::GraphQL::Field.define do
      name "taxons"
      description "Taxon list"

      argument :ids, types[types.ID]

      type types[TaxonType]

      resolve TaxonResolver::All
    end
  end
end
