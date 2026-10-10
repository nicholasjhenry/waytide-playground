defmodule WaytidePlayground.EventStore.Event do
  @enforce_keys [:type, :data, :tags]
  defstruct [:type, :data, tags: []]
end
