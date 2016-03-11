defmodule BlockchainInfo do
  use HTTPoison.Base

  @moduledoc """
  Blockchain.info endpoints wrapped with HTTPoison
  """

  defp process_response_body(body) do
    body
  end

  def bitcoins_in_circulation do
    {:ok, res} = BlockchainInfo.get("https://blockchain.info/q/totalbc")
    res.body
    |> String.to_integer
    |> div(100000000)
  end

end
