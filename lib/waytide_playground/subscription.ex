defmodule WaytidePlayground.Subscription do
  alias WaytidePlayground.EventStore
  alias WaytidePlayground.EventStore.{AppendCondition, Event, Query, QueryItem}

  def plan(user_id) do
    case EventStore.read(upgrades(user_id)) do
      [] -> :free
      _ -> :pro
    end
  end

  def upgrade(user_id) do
    query = upgrades(user_id)

    case EventStore.read(query) do
      [] ->
        event = %Event{
          type: "plan upgraded",
          data: %{user_id: user_id, plan: :pro},
          tags: [user_tag(user_id)]
        }

        EventStore.append([event], %AppendCondition{fail_if_events_match: query})

      _ ->
        :error
    end
  end

  defp upgrades(user_id) do
    %Query{items: [%QueryItem{types: ["plan upgraded"], tags: [user_tag(user_id)]}]}
  end

  defp user_tag(user_id), do: "user:" <> user_id
end
