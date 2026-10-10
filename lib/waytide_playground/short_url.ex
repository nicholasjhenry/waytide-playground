defmodule WaytidePlayground.ShortURL do
  alias WaytidePlayground.EventStore
  alias WaytidePlayground.EventStore.{AppendCondition, Event, Query, QueryItem}

  @base_url "https://wt.io/"

  def shorten(url) do
    code =
      :crypto.strong_rand_bytes(6)
      |> Base.url_encode64(padding: false)
      |> binary_part(0, 6)

    query = code_query(code)

    event = %Event{
      type: "url shortened",
      data: %{code: code, url: url},
      tags: ["short-url:" <> code]
    }

    :ok = EventStore.append([event], %AppendCondition{fail_if_events_match: query})

    {:ok, @base_url <> code}
  end

  def expand(@base_url <> code) do
    case EventStore.read(code_query(code)) do
      [sequenced_event] -> {:ok, sequenced_event.event.data.url}
      [] -> :error
    end
  end

  defp code_query(code) do
    %Query{items: [%QueryItem{types: ["url shortened"], tags: ["short-url:" <> code]}]}
  end
end
