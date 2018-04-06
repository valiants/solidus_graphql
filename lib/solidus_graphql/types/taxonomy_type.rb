module Solidus
  module GraphQL
    TaxonomyType = ::GraphQL::ObjectType.define do
      name "Taxonomy"

      field :id,          types.ID
      field :name,        types.String
      field :position,    types.Int

      field :root_taxon, TaxonType do
        resolve ->(taxonomy, args, ctx) do
          taxonomy.root
        end
      end

      connection :taxons, TaxonType.connection_type do
        resolve TaxonResolver::ByTaxonomy
      end
    end
  end
end
