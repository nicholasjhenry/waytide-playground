defmodule EventStoreTest do
  use ExUnit.Case

  alias WaytidePlayground.EventStore

  test "appends events" do
    control_events = [Controls.Event.example()]
    control_query = Controls.Query.example()
    control_condition = Controls.AppendCondition.example()

    assert(EventStore.read(control_query) == [])

    :ok = EventStore.append(control_events, control_condition)

    read_events =
      EventStore.read(control_query)
      |> Enum.map(& &1.event)

    assert(read_events == control_events)
  end
end
