defmodule Subscription.UpgradeTest do
  use ExUnit.Case

  alias WaytidePlayground.Subscription

  test "is pro" do
    control_user_id = Controls.UserID.unique_example()

    :ok = Subscription.upgrade(control_user_id)

    plan = Subscription.plan(control_user_id)

    assert(plan == :pro)
  end
end
