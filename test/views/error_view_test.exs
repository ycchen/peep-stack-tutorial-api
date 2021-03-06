defmodule Peepchat.ErrorViewTest do
  use Peepchat.ConnCase, async: true

  # Bring render/3 and render_to_string/3 for testing custom views
  import Phoenix.View

  test "renders 404.json" do
    assert render(Peepchat.ErrorView, "404.json", []) ==
           %{errors: %{code: 404, detail: "Page not found"}}
  end

  test "render 500.json" do
    assert render(Peepchat.ErrorView, "500.json", []) ==
           %{errors: %{code: 500, detail: "Internal server error"}}
  end

  test "render any other" do
    assert render(Peepchat.ErrorView, "505.json", []) ==
           %{errors: %{code: 500, detail: "Internal server error"}}
  end
end
