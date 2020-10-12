defmodule Bah do
  def load() do
    [:code.priv_dir(:bah), "nif", "bah"]
    |> Path.join()
    |> to_charlist()
    |> :erlang.load_nif(0)
  end

  def bah() do
    raise "nif not loaded!"
  end
end
