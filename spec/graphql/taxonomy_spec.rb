require "spec_helper"

describe "graphql taxonomy" do
  let!(:taxonomy) { create_list(:taxonomy, 4) }

  it "returns available taxonomies" do
    available_taxonomies = <<-GRAPHQL
    {
      taxonomies {
        name
      }
    }
    GRAPHQL

    response     = Solidus::GraphQL::Schema.execute(available_taxonomies)
    taxonomies   = response.dig("data", "taxonomies")

    expect(response["errors"]).to be_nil
    expect(taxonomies.count).to eq(4)
  end
end
