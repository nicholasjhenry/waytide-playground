defmodule ShortURLTest do
  use ExUnit.Case

  alias WaytidePlayground.ShortURL

  test "expands to the original URL" do
    control_url = Controls.URL.example()
    control_user_id = Controls.UserID.example()

    {:ok, short_url} = ShortURL.shorten(control_url, control_user_id)

    {:ok, expanded_url} = ShortURL.expand(short_url, control_user_id)

    assert(expanded_url == control_url)
  end
end
