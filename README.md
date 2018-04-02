# Solidus::GraphQL

Supported [solidus](https://github.com/solidusio/solidus) version 2.5.0

## Summary
This gem is built so that we can build an [Apollo](https://www.apollographql.com/client/) based React storefront. For now it only supports unauthenticated read-only queries. Various core types will be added as the storefront is developed. I'm not familiar with the internal of solidus yet so any suggestion is very welcomed!

## TODO
* [ ] TaxonType
* [ ] ProductType
* [ ] VariantType
* [ ] ClassificationType

The following features require authentication

* [ ] Authorization
* [ ] UserType
* [ ] OrderType
* [ ] Order Mutations

## Installation

Add this line to your application's Gemfile:

```ruby
gem "solidus_graphql"
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install solidus_graphql

## Usage

* Install the [graphql](https://github.com/rmosolgo/graphql-ruby) gem then [getting-started](https://github.com/rmosolgo/graphql-ruby#getting-started)
* Build up `QueryType` with the types provided by `solidus_graphql`

```ruby
Types::QueryType = GraphQL::ObjectType.define do
  name "Query"

  field :products, Solidus::GraphQL::ProductsField
  field :taxons,   Solidus::GraphQL::TaxonsField
end
```

The `current_user` and `current_store` contexts can be injected in `graphql_controller`. If `current_store` is not provided `Solidus::GraphQL::NullStore` will be used instead. `current_user` can be provided but it's not doing anything yet because the queries are not being scoped.

```ruby
context = {
  # current_user: current_user,
  # current_store: get_current_store_somehow,
}
result = Schema.execute(query, variables: variables, context: context, operation_name: operation_name)
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/solidus_graphql. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## Code of Conduct

Everyone interacting in the SolidusGraphQL project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/solidus_graphql/blob/master/CODE_OF_CONDUCT.md).

## License
`solidus_graphql` is released under the [MIT License](https://opensource.org/licenses/MIT).
