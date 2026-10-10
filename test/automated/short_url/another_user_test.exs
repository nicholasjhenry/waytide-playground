defmodule ShortURL.AnotherUserTest do
  use ExUnit.Case

  alias WaytidePlayground.ShortURL

  describe "when expanded by another user" do
    test "fails" do
      control_url = Controls.URL.example()
      control_user_id = Controls.UserID.example()
      control_other_user_id = Controls.UserID.other_example()

      {:ok, short_url} = ShortURL.shorten(control_url, control_user_id)

      result = ShortURL.expand(short_url, control_other_user_id)

      assert(result == :error)
    end
  end
end
