class VariantResolver
  class ByProduct
    def self.call(product, args, ctx)
      # TODO: query(args)
      product.variants.to_a
    end
  end
end
