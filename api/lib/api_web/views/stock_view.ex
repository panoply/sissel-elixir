defmodule ApiWeb.StockView do
  use ApiWeb, :view
  alias ApiWeb.StockView

  def render("centra.json", %{stock: body}) do
    IO.inspect(body)
    %{data: body}
  end

  def render("error.json", _assigns) do
    %{errors: %{detail: "Internal server error"}}
  end

end
