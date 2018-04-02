module Solidus
  module GraphQL
    class NullStore
      def default_currency
        Spree::Config[:currency] || "USD"
      end

      def cart_tax_country_iso
        nil
      end
    end
  end
end
