defmodule SubscriptionTest do
  use ExUnit.Case

  alias WaytidePlayground.Subscription

  test "is free by default" do
    control_user_id = Controls.UserID.unique_example()

    plan = Subscription.plan(control_user_id)

    assert(plan == :free)
  end
end
