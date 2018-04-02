module Solidus
  module GraphQL
    CurrencyType = ::GraphQL::ObjectType.define do
      name "Currency"

      field :iso_code, types.String
      field :name,     types.String
      field :symbol,   types.String
      field :subunit,  types.String
    end
  end
end
