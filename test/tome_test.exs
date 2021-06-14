defmodule TomeTest do
  use ExUnit.Case
  doctest Tome

  test "greets the world" do
    assert Tome.hello() == :world
  end
end
