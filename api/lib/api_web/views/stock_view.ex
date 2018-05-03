defmodule ApiWeb.StockView do
  use ApiWeb, :view
  alias ApiWeb.StockView

  # Centra Stock API
  def render("centra.json", %{stock: body}) do
    %{data: body["products"]}
  end

  # Centra Stock API
  def render("shopify.json", %{products: products}) do
    variants =
      products
      |> Enum.map(fn product ->
        product_variants = Map.get(product, "variants", [])
        Enum.map(product_variants, &reduce_shopify_variant/1)
      end)
      |> List.flatten()

    %{data: variants}
  end

  # Error View
  def render("error.json", _assigns) do
    %{errors: %{detail: "Internal server error"}}
  end

  # Modify Shopify Variant
  defp reduce_shopify_variant(variant) do
    %{
      id: Map.get(variant, "id"),
      product_id: Map.get(variant, "product_id"),
      sku: Map.get(variant, "sku"),
      inventory_quantity: Map.get(variant, "inventory_quantity")
    }
  end

end
