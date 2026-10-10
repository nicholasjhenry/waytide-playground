defmodule Controls.AppendCondition do
  alias WaytidePlayground.EventStore.AppendCondition

  def example do
    %AppendCondition{fail_if_events_match: Controls.Query.example(), after: nil}
  end
end
