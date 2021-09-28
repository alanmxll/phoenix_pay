defmodule PhoenixPay.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      PhoenixPay.Repo,
      # Start the Telemetry supervisor
      PhoenixPayWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: PhoenixPay.PubSub},
      # Start the Endpoint (http/https)
      PhoenixPayWeb.Endpoint
      # Start a worker by calling: PhoenixPay.Worker.start_link(arg)
      # {PhoenixPay.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: PhoenixPay.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    PhoenixPayWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
