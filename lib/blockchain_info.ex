defmodule BlockchainInfo do
  use HTTPoison.Base

  @moduledoc """
  Blockchain.info endpoints wrapped with HTTPoison
  """

  def bitcoins_in_circulation do
    {:ok, res} = BlockchainInfo.get("/q/totalbc")
    res.body
    |> String.to_integer
    |> div(100000000)
  end

  def blocks do
     {:ok, res} = BlockchainInfo.get("/blocks?format=json")
     res.body
     |> Poison.Parser.parse!
     |> Map.get("blocks")
  end

  defp process_response_body(body) do
    body
  end

  defp process_url(path) do
     "https://blockchain.info" <> path
  end


end
