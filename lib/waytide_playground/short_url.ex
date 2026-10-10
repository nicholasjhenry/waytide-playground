defmodule WaytidePlayground.ShortURL do
  alias WaytidePlayground.EventStore
  alias WaytidePlayground.EventStore.{AppendCondition, Event, Query, QueryItem}

  @base_url "https://wt.io/"

  def shorten(url, user_id) do
    code =
      :crypto.strong_rand_bytes(6)
      |> Base.url_encode64(padding: false)
      |> binary_part(0, 6)

    query = query([code_tag(code)])

    event = %Event{
      type: "url shortened",
      data: %{code: code, url: url, user_id: user_id},
      tags: [code_tag(code), user_tag(user_id)]
    }

    :ok = EventStore.append([event], %AppendCondition{fail_if_events_match: query})

    {:ok, @base_url <> code}
  end

  def expand(@base_url <> code, user_id) do
    case EventStore.read(query([code_tag(code), user_tag(user_id)])) do
      [sequenced_event] -> {:ok, sequenced_event.event.data.url}
      [] -> :error
    end
  end

  defp query(tags) do
    %Query{items: [%QueryItem{types: ["url shortened"], tags: tags}]}
  end

  defp code_tag(code), do: "short-url:" <> code

  defp user_tag(user_id), do: "user:" <> user_id
end
