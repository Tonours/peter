defmodule Peter.Admin.PageController do
  use Peter.Web, :controller

  alias Peter.Replique

  def index(conn, _params) do
    repliques = Repo.all(Replique)
    query = from(r in Replique, where: r.published == true)
    total = length(repliques)
    published = query
      |> Repo.all
      |> length
    unpublished = total - published
    label = if (total > 1), do: "répliques", else: "réplique"


    repliques_info = %{
      total: total,
      published: published,
      unpublished: unpublished,
      label: label
    }
    render(conn, "index.html", repliques_info: repliques_info)
  end
end
