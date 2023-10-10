defmodule InvestifyWeb.Dashboard.DashboardLive do
  use InvestifyWeb, :live_view

  alias InvestifyWeb.Components.{Sidebar, Navbar, Main}

  def mount(_params, _session, socket) do
    {:ok, socket}
  end
end
