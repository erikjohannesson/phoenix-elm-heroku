defmodule PhoenixElmHeroku.Web.PageController do
  use PhoenixElmHeroku.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
