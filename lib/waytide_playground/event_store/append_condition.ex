defmodule WaytidePlayground.EventStore.AppendCondition do
  @enforce_keys [:fail_if_events_match]
  defstruct [:fail_if_events_match, after: nil]
end
