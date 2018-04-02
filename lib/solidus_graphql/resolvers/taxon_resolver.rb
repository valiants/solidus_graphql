module Solidus
  module GraphQL
    class TaxonResolver
      class All
        def self.call(obj, args, ctx)
          Spree::Taxon.all
        end
      end
    end
  end
end
