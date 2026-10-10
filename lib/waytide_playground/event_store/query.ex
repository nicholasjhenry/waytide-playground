defmodule WaytidePlayground.EventStore.Query do
  alias WaytidePlayground.EventStore.QueryItem

  @enforce_keys [:items]
  defstruct [:items]

  def matches?(%__MODULE__{items: items}, event) do
    Enum.any?(items, &QueryItem.matches?(&1, event))
  end
end
