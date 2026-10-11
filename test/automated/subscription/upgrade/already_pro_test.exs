defmodule Subscription.Upgrade.AlreadyProTest do
  use ExUnit.Case

  alias WaytidePlayground.Subscription

  describe "when already pro" do
    test "fails" do
      control_user_id = Controls.UserID.unique_example()

      :ok = Subscription.upgrade(control_user_id)

      result = Subscription.upgrade(control_user_id)

      assert(result == :error)
    end
  end
end
