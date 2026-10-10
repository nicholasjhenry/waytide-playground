defmodule WaytidePlayground.ShortURL do
  @base_url "https://wt.io/"
  @table __MODULE__

  def create_table do
    :ets.new(@table, [:named_table, :public, read_concurrency: true])
  end

  def shorten(url) do
    code =
      :crypto.strong_rand_bytes(6)
      |> Base.url_encode64(padding: false)
      |> binary_part(0, 6)

    true = :ets.insert_new(@table, {code, url})

    {:ok, @base_url <> code}
  end

  def expand(@base_url <> code) do
    case :ets.lookup(@table, code) do
      [{^code, url}] -> {:ok, url}
      [] -> :error
    end
  end
end
