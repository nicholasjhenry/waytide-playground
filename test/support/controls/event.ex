defmodule Controls.Event do
  alias WaytidePlayground.EventStore.Event

  def example do
    %Event{
      type: "some event type",
      data: %{"some_attribute" => "some value"},
      tags: ["some-entity:some-id"]
    }
  end
end
