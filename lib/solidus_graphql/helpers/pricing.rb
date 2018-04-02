module Solidus
  module GraphQL
    class Pricing
      def self.current_options(ctx)
        current_store = ctx.fetch("current_store", NullStore.new)
        # https://github.com/solidusio/solidus/blob/v2.5/core/app/models/spree/variant/price_selector.rb
        # https://github.com/solidusio/solidus/blob/v2.5/core/lib/spree/core/controller_helpers/pricing.rb
        Spree::Config.pricing_options_class.new(
          currency:    current_store.default_currency,
          country_iso: current_store.cart_tax_country_iso,
        )
      end
    end
  end
end
