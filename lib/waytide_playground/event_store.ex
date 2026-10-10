defmodule WaytidePlayground.EventStore do
  use GenServer

  alias __MODULE__.{AppendCondition, Query, SequencedEvent}

  def start_link(_opts) do
    GenServer.start_link(__MODULE__, 0, name: __MODULE__)
  end

  def append(events, %AppendCondition{} = condition) do
    GenServer.call(__MODULE__, {:append, events, condition})
  end

  def read(%Query{} = query) do
    :ets.tab2list(__MODULE__)
    |> Enum.map(fn {position, event} -> %SequencedEvent{position: position, event: event} end)
    |> Enum.filter(&Query.matches?(query, &1.event))
  end

  @impl true
  def init(position) do
    :ets.new(__MODULE__, [:named_table, :ordered_set, :protected, read_concurrency: true])

    {:ok, position}
  end

  @impl true
  def handle_call({:append, events, _condition}, _from, position) do
    position =
      Enum.reduce(events, position, fn event, position ->
        :ets.insert(__MODULE__, {position + 1, event})
        position + 1
      end)

    {:reply, :ok, position}
  end
end
