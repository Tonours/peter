defmodule Peter.Admin.PageController do
  use Peter.Web, :controller

  def index(conn, _params) do
    current_user = Guardian.Plug.current_resource(conn)

    render conn, "index.html"
  end
end
