defmodule CommunityTest do
  use ExUnit.Case
  doctest Community

  test "greets the world" do
    assert Community.hello() == :world
  end
end
