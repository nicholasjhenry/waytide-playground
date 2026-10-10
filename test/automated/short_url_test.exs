defmodule ShortURLTest do
  use ExUnit.Case

  alias WaytidePlayground.ShortURL

  test "expands to the original URL" do
    control_url = Controls.URL.example()

    {:ok, short_url} = ShortURL.shorten(control_url)

    {:ok, expanded_url} = ShortURL.expand(short_url)

    assert(expanded_url == control_url)
  end
end
