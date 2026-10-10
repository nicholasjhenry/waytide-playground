defmodule WaytidePlayground.EventStore.QueryItem do
  defstruct types: [], tags: []

  def matches?(%__MODULE__{types: types, tags: tags}, event) do
    type_matches = types == [] or event.type in types
    tags_match = Enum.all?(tags, &(&1 in event.tags))

    type_matches and tags_match
  end
end
