require "spec_helper"

describe "graphQL taxon" do
  let!(:taxonomy) { create(:taxonomy, name: "Category") }
  let!(:super_clothing) { taxonomy.root.children.create(name: "Super Clothing") }
  let!(:t_shirts) { super_clothing.children.create(name: "T-Shirts") }
  let!(:xxl) { t_shirts.children.create(name: "XXL") }
  let!(:product) do
    create(:product, name: "Superman T-Shirt").tap do |product|
      product.taxons << t_shirts
    end
  end
  let(:metas) { { meta_description: "Brand new Ruby on Rails TShirts", meta_title: "Ruby On Rails TShirt", meta_keywords: "ror, tshirt, ruby" } }
  let(:store_name) do
    ((first_store = Spree::Store.first) && first_store.name).to_s
  end

  it "returns available taxons" do
    available_taxons = <<-GRAPHQL
    {
      taxons {
        name
      }
    }
    GRAPHQL

    response = Solidus::GraphQL::Schema.execute(available_taxons)
    taxons   = response.dig("data", "taxons")

    expect(response["errors"]).to be_nil
    expect(taxons.count).to eq(4)
  end

  it "returns taxon.products" do
    taxons_products = <<-GRAPHQL
    {
      taxons {
        name
        products {
          edges {
            node {
              name
            }
          }
        }
      }
    }
    GRAPHQL

    response = Solidus::GraphQL::Schema.execute(taxons_products)
    taxon_node = response.dig("data", "taxons").select { |tx| tx["name"] == t_shirts.name }

    expect(response["errors"]).to be_nil
    expect(taxon_node.dig(0, "products", "edges", 0, "node", "name")).to eq(product.name)
  end
end
