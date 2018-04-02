module Solidus
  module GraphQL
    PriceType = ::GraphQL::ObjectType.define do
      name "Price"

      field :amount, types.Float do
        resolve ->(price, args, ctx) do
          price.money.fractional.to_f / price.money.currency.subunit_to_unit
        end
      end

      field :subunit_amount, types.Int do
        resolve ->(price, args, ctx) do
          price.money.fractional
        end
      end

      field :currency, CurrencyType do
        resolve ->(price, args, ctx) do
          price.money.currency
        end
      end
    end
  end
end
