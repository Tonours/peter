defmodule Peter.Admin.RepliqueController do
  use Peter.Web, :controller

  alias Peter.Replique

  def index(conn, _params) do
    repliques = Repo.all(Replique)

    render(conn, "index.html", repliques: repliques)
  end

  def new(conn, _params) do

    changeset = Replique.changeset(%Replique{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"replique" => replique_params}) do

    changeset = Replique.changeset(%Replique{}, replique_params)

    case Repo.insert(changeset) do
      {:ok, _replique} ->
        conn
        |> put_flash(:info, "Replique created successfully.")
        |> redirect(to: admin_replique_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do

    replique = Repo.get!(Replique, id)
    render(conn, "show.html", replique: replique)
  end

  def edit(conn, %{"id" => id}) do

    replique = Repo.get!(Replique, id)
    changeset = Replique.changeset(replique)
    render(conn, "edit.html", replique: replique, changeset: changeset)
  end

  def update(conn, %{"id" => id, "replique" => replique_params}) do

    replique = Repo.get!(Replique, id)
    changeset = Replique.changeset(replique, replique_params)

    case Repo.update(changeset) do
      {:ok, replique} ->
        conn
        |> put_flash(:info, "Replique updated successfully.")
        |> redirect(to: admin_replique_path(conn, :show, replique))
      {:error, changeset} ->
        render(conn, "edit.html", replique: replique, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do

    replique = Repo.get!(Replique, id)
    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Peter.RepliqueImage.delete({replique.image, replique})
    Peter.RepliqueVideo.delete({replique.video, replique})
    Peter.RepliqueSong.delete({replique.song, replique})

    Repo.delete!(replique)

    conn
    |> put_flash(:info, "Replique deleted successfully.")
    |> redirect(to: admin_replique_path(conn, :index))
  end
end
