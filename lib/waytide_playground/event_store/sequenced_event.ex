defmodule WaytidePlayground.EventStore.SequencedEvent do
  @enforce_keys [:position, :event]
  defstruct [:position, :event]
end
