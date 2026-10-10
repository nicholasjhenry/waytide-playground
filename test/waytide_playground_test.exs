defmodule WaytidePlaygroundTest do
  use ExUnit.Case
  doctest WaytidePlayground

  test "greets the world" do
    assert WaytidePlayground.hello() == :world
  end
end
