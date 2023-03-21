defmodule InvestifyWeb.PageController do
  use InvestifyWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
