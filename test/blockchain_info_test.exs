defmodule BlockchainInfoTest do
  use ExUnit.Case
  doctest BlockchainInfo

  test "number of bitcoins in circulation is in acceptable range" do
    n_coin = BlockchainInfo.bitcoins_in_circulation
    assert is_integer(n_coin) and n_coin <= 21_000_000 and n_coin >= 15_000_000
  end

  test "returns list of blocks" do
    assert is_list(BlockchainInfo.blocks())
  end
end
