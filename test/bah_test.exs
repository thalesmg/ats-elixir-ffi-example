defmodule BahTest do
  use ExUnit.Case

  test "it works" do
    assert Bah.load() == :ok
    assert Bah.bah() == 17
  end
end
