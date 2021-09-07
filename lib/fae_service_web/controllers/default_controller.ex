defmodule FaeServiceWeb.DefaultController do
  use FaeServiceWeb, :controller

  def index(conn, _params) do
    text conn, "FaeService!"
  end
end
