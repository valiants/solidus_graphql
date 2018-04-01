class ProductResolver
  class All
    def self.call(obj, args, ctx)
      Spree::Product.available
    end
  end
end
