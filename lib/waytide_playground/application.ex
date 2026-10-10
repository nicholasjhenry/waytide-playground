defmodule WaytidePlayground.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    WaytidePlayground.ShortURL.create_table()

    children = [
      # Starts a worker by calling: WaytidePlayground.Worker.start_link(arg)
      # {WaytidePlayground.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: WaytidePlayground.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
