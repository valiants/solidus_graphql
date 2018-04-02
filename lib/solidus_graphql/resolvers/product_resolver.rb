class ProductResolver
  class All
    def self.call(obj, args, ctx)
      Spree::Product.available
    end
  end

  class ByTaxon
    def self.call(taxon, args, ctx)
      taxon.products.to_a
    end
  end
end
