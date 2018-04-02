class ProductResolver
  class All
    def self.call(obj, args, ctx)
      # TODO: query(args)
      Spree::Product.available
    end
  end

  class Variants
    def self.call(product, args, ctx)
      # TODO: query(args)
      product.variants.to_a
    end
  end

  class ByTaxon
    def self.call(taxon, args, ctx)
      # TODO: query(args)
      taxon.products.not_deleted.available.to_a
    end
  end
end
