defmodule Peter.RepliqueController do
  use Peter.Web, :controller

  alias Peter.Replique

  def index(conn, _params) do
    repliques =
      from(r in Replique, where: r.published == true)
      |> Repo.all

    render conn, "index.json", repliques: repliques
  end

  def show(conn, %{"id" => id}) do
    replique = Repo.get(Replique, id)

    render(conn, "show.json", replique: replique)
  end

end
