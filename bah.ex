defmodule Bah do
  def load() do
    :erlang.load_nif('./bah', 0)
  end

  def bah() do
    raise "eita"
  end
end
