defmodule Peter.RepliqueView do
  use Peter.Web, :view

  def render("index.json", %{repliques: repliques}) do
    %{
      repliques: Enum.map(repliques, &replique_json/1)
    }
  end

  def render("show.json", %{replique: replique}) do
      %{ replique: replique_json(replique) }
  end

  def replique_json(replique) do
    %{
      id: replique.id,
      title: replique.title,
      description: replique.description,
      image:  Map.merge(
        Peter.RepliqueImage.urls({replique.image, replique}),
        replique.image
      ),
      song: Map.merge(
        Peter.RepliqueSong.urls({replique.song, replique}),
        replique.song
      ),
      video: Map.merge(
        Peter.RepliqueVideo.urls({replique.video, replique}),
        replique.video
      ),
      inserted_at: replique.inserted_at,
      updated_at: replique.updated_at
    }
  end
end
