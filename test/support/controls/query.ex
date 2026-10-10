defmodule Controls.Query do
  alias WaytidePlayground.EventStore.Query
  alias WaytidePlayground.EventStore.QueryItem

  def example do
    %Query{
      items: [
        %QueryItem{types: ["some event type"], tags: ["some-entity:some-id"]}
      ]
    }
  end
end
