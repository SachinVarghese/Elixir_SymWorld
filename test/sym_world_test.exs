defmodule SymWorldTest do
  use ExUnit.Case
  doctest SymWorld

  test "greets the world" do
    assert SymWorld.hello() == :world
  end
end
