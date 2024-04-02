defmodule Arnie.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  alias Arnie.Server
  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Starts a worker by calling: Arnie.Worker.start_link(arg)
      {Server, :unused}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Arnie.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
