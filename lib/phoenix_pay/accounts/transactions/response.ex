defmodule PhoenixPay.Accounts.Transactions.Response do
  alias PhoenixPay.Account

  defstruct [:from_account, :to_account]

  def build(%Account{} = from_account, %Account{} = to_account) do
    %__MODULE__{
      from_account: from_account,
      to_account: to_account
    }
  end
end
